import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class TextFieldComment extends StatelessWidget {
  const TextFieldComment(
      {super.key, required this.onPressEnter, required this.commentController});

  final void Function() onPressEnter;
  final TextEditingController commentController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width * 1,
      color: ColorsConstant.darkPrimaryColor,
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: commentController,
        scrollPadding: const EdgeInsets.only(bottom: 40),
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
            hintText: "Comment",
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorsConstant.textLightGrey),
            ),
            hintStyle: TextStyle(color: ColorsConstant.textLightGrey),
            suffixIcon: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                    onTap: onPressEnter,
                    child: const Icon(
                      Icons.send,
                      color: Colors.white,
                    )))),
      ),
    );
  }
}
