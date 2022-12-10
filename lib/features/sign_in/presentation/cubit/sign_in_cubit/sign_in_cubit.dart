import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:no_context_navigation/no_context_navigation.dart';

import '../../../../../core/routes/router.dart';

part 'sign_in_state.dart';
part 'sign_in_cubit.freezed.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(const SignInState.initial());

  final FirebaseAuth auth = FirebaseAuth.instance;
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  void signedInCheck() {
    if (auth.currentUser != null) {
      navService.pushNamedAndRemoveUntil(AppRoute.homeScreenRoute);
    }
  }

  void signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    try {
      emit(const SignInState.loading());
      auth.signInWithCredential(credential).then((value) async {
        await users.doc(value.user!.uid).set({
          'email': value.user!.email,
          'google_id': value.user!.uid,
        });
      });
      emit(const SignInState.loaded());
    } on FirebaseAuthException catch (error) {
      emit(SignInState.error(error.message.toString()));
    } on PlatformException catch (error) {
      emit(SignInState.error(error.message.toString()));
    } catch (error) {
      emit(SignInState.error(error.toString()));
    }
  }
}
