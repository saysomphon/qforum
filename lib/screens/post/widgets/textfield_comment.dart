import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

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
      padding: EdgeInsets.all(8.0),
      child: TextField(
        controller: commentController,
        scrollPadding: EdgeInsets.only(bottom: 40),
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            hintText: "Comment",
            enabledBorder: UnderlineInputBorder(
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
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                    )))),
      ),
    );
  }
}
