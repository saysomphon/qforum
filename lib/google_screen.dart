import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qfoumn/authen_method.dart';

class GoogleSigninScreen extends StatefulWidget {
  const GoogleSigninScreen({super.key});

  @override
  State<GoogleSigninScreen> createState() => _GoogleSigninScreenState();
}

class _GoogleSigninScreenState extends State<GoogleSigninScreen> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

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
                'assets/svgs/Frame.svg',
                semanticsLabel: 'Acme Logo',
              ),
            ),
            InkWell(
              onTap: () =>
                  AuthenMethod().signInWithGoogle().then((value) async {
                await users
                    .add({
                      'email': value.user!.email,
                      'google_id': value.user!.uid,
                    })
                    .then(
                      (value) => print("User Added"),
                    )
                    .catchError(
                      (error) => print("Failed to add user: $error"),
                    );
              }),
              child: Center(
                child: Container(
                  width: 200,
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
                        'assets/svgs/Google.svg',
                        height: 30,
                        semanticsLabel: 'Google Logo',
                      ),
                      const SizedBox(width: 5),
                      const Text("Signin With Google"),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
