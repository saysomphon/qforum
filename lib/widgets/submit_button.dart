import 'package:flutter/material.dart';
import 'package:qfoumn/constants/colors.dart';

class SubmitButton extends StatelessWidget {
  final String tilte;
  final void Function() press;
  const SubmitButton(
      {super.key,
      required this.tilte,
      required this.press,
      this.isLoading = false});
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (!isLoading) {
          press();
        }
      },
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(100, 50),
          backgroundColor:
              isLoading ? Colors.grey : ColorsConstant.darkPrimaryColor),
      child: isLoading
          ? const CircularProgressIndicator(
              color: Colors.white,
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  tilte,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(width: 8),
                const Icon(
                  Icons.send,
                  color: Colors.white,
                  size: 20,
                ),
              ],
            ),
    );
  }
}
