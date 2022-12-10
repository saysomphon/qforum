import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:qfoumn/firebase_options.dart';
import 'package:qfoumn/screens/home/home_screen.dart';
import 'package:qfoumn/screens/post/post_screen.dart';
import 'package:qfoumn/screens/post_title/post_title_screen.dart';
import 'package:qfoumn/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: HomeScreen(),
    );
  }
}
