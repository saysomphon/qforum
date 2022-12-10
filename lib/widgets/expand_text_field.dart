import 'package:flutter/material.dart';

class ExpandTextField extends StatelessWidget {
  final TextEditingController textController;
  final double contentSize;
  final String hintText;
  const ExpandTextField(
      {super.key,
      required this.textController,
      required this.contentSize,
      required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        fontSize: contentSize,
        color: Colors.white,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey, width: 2.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 2.0, color: Colors.grey),
        ),
      ),
      maxLines: null,
      cursorColor: Colors.white,
      controller: textController,
    );
  }
}
