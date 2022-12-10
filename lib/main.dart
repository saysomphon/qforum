import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:qfoumn/firebase_options.dart';
import 'package:qfoumn/theme.dart';
import 'package:no_context_navigation/no_context_navigation.dart';

import 'core/routes/router.dart';

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
      //set up navigation
      navigatorKey: NavigationService.navigationKey,
      onGenerateRoute: (settings) => AppRoute.routeGenerate(settings),
      initialRoute: AppRoute.initialRoute,
    );
  }
}
