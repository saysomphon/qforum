import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key, required this.onPress});
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPress, iconSize: 30, icon: const Icon(Icons.logout));
  }
}
