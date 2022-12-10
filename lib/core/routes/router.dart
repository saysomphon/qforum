import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qfoumn/features/sign_in/presentation/cubit/sign_in_cubit/sign_in_cubit.dart';
import 'package:qfoumn/features/sign_in/presentation/screen/sign_in_screen.dart';
import 'package:qfoumn/screens/home/home_screen.dart';

class AppRoute {
  static const String initialRoute = "/";
  static const String singInScreenRoute = "/signIn";
  static const String homeScreenRoute = "/home";
  static Route<dynamic>? routeGenerate(RouteSettings settings) {
    switch (settings.name) {
      case initialRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => SignInCubit(),
            child: const SignInScreen(),
          ),
        );
      case singInScreenRoute:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case homeScreenRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return null;
    }
  }
}
