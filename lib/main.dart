import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:qfoumn/firebase_options.dart';
import 'package:qfoumn/screens/google_sign_in/google_sign_in.dart';
import 'package:qfoumn/screens/home/home_screen.dart';
import 'package:qfoumn/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var isLogin = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      home: isLogin == null
          ? const GoogleSigninScreen()
          : isLogin != null
              ? const HomeScreen()
              : const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
    );
  }
}
