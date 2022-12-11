import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qfoumn/screens/home/home_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qfoumn/utils/auth_method.dart';

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
                'assets/svgs/Frame.svg',
                semanticsLabel: 'Acme Logo',
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isLoading = true;
                });
                AuthenMethod().signInWithGoogle().then(
                  (value) async {
                    await users.doc(value.user!.uid).set({
                      'email': value.user!.email,
                      'google_id': value.user!.uid,
                    }).then(
                      (getValue) {
                        setState(() {
                          isLoading = false;
                        });
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                            (Route<dynamic> route) => false);
                      },
                    ).catchError(
                      (error) {
                        setState(() {
                          isLoading = false;
                        });
                        showToast(message: e);
                      },
                    );
                  },
                );
              },
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
                      Container(
                        child: isLoading == true
                            ? const SizedBox(
                                height: 30,
                                width: 30,
                                child: CircularProgressIndicator(),
                              )
                            : SvgPicture.asset(
                                'assets/svgs/Google.svg',
                                height: 30,
                                semanticsLabel: 'Google Logo',
                              ),
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        "Signin With Google",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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

  void showToast({message}) => Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
}
