import 'package:flutter/material.dart';
import 'package:qfoumn/constants/colors.dart';

class SendButton extends StatelessWidget {
  final String tilte;
  final void Function() press;
  const SendButton(
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
              isLoading ? Colors.grey : ColorsConstant.buttonSubmitColor),
      child: isLoading
          ? const CircularProgressIndicator(
              color: Colors.white,
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.send,
                  color: Colors.white,
                  size: 16,
                ),
                const SizedBox(width: 8),
                Text(
                  tilte,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                )
              ],
            ),
    );
  }
}
