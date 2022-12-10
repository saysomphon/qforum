import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:qfoumn/screens/sign_in/sign_in_screen.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key, required this.onPress});
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPress, iconSize: 30, icon: const Icon(Icons.logout));
  }
}
