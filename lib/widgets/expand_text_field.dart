import 'package:flutter/material.dart';
import 'package:qfoumn/constants/colors.dart';

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
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          color: ColorsConstant.darkPrimaryColor,
          borderRadius: BorderRadius.circular(8)),
      child: TextField(
        style: TextStyle(fontSize: contentSize, color: Colors.white),
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(16),
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.white)),
        autofocus: false,
        // focusNode: _focusnode,
        maxLines: null,
        controller: textController,
        keyboardType: TextInputType.text,
      ),
    );
  }
}
