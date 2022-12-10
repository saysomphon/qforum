import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:no_context_navigation/no_context_navigation.dart';
import 'package:qfoumn/core/constants/path.dart';
import 'package:qfoumn/core/constants/string.dart';
import 'package:qfoumn/features/sign_in/presentation/cubit/sign_in_cubit/sign_in_cubit.dart';

import '../../../../core/routes/router.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 25, 97, 156),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              constraints: const BoxConstraints(maxWidth: 250, minWidth: 200),
              child: SvgPicture.asset(
                ImagePath.appLogo,
              ),
            ),
            BlocConsumer<SignInCubit, SignInState>(
              listener: (context, state) {
                state.when(
                    initial: () {},
                    loading: () {},
                    loaded: () {
                      navService.pushNamed(AppRoute.homeScreenRoute);
                    },
                    error: (error) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(error),
                        backgroundColor: Colors.red,
                      ));
                    });
              },
              builder: (context, state) {
                return InkWell(
                  onTap: () {
                    context.read<SignInCubit>().signInWithGoogle();
                  },
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            ImagePath.googleIcon,
                            height: 30,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            StringTitle.singInWithGoogle,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
