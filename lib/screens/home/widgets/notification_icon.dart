import 'package:flutter/material.dart';

class NotificationIconButton extends StatelessWidget {
  const NotificationIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {},
        iconSize: 30,
        icon: Icon(Icons.notifications_outlined));
  }
}
