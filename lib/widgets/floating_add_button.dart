import 'package:flutter/material.dart';
import 'package:qfoumn/constants/colors.dart';

class FloatingAddButton extends StatelessWidget {
  const FloatingAddButton({super.key, required this.onPressed});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: ColorsConstant.darkPrimaryColor,
      child: const Icon(
        Icons.add,
        color: Colors.white,
        size: 50,
      ),
    );
  }
}
