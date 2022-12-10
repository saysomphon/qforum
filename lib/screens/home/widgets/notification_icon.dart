import 'package:flutter/material.dart';

class NotificationIconButton extends StatelessWidget {
  final double paddingAll;
  const NotificationIconButton({super.key, required this.paddingAll});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(paddingAll),
      child: IconButton(
          splashRadius: 20,
          onPressed: () {},
          iconSize: 40,
          icon: const Icon(Icons.notifications_outlined)),
    );
  }
}
