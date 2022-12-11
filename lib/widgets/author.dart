import 'package:flutter/material.dart';
import 'package:qfoumn/constants/colors.dart';

class Author extends StatelessWidget {
  const Author({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        WidgetSpan(
            child: Icon(
          Icons.person,
          color: ColorsConstant.textAuthorColor,
          size: 25,
        )),
        TextSpan(
            text: text, style: TextStyle(color: ColorsConstant.textAuthorColor))
      ]),
    );
  }
}
