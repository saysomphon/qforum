import 'package:flutter/material.dart';
import 'package:qfoumn/constants/colors.dart';

class FloatingAddButton extends StatelessWidget {
  const FloatingAddButton(
      {super.key, required this.onPressed, this.icon = Icons.add});

  final void Function() onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: ColorsConstant.darkPrimaryColor,
      child: Icon(
        icon,
        color: Colors.white,
        size: 50,
      ),
    );
  }
}
