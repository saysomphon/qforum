import 'package:flutter/material.dart';
import 'package:qfoumn/constants/colors.dart';
import 'package:qfoumn/constants/padding.dart';

class CardForumType extends StatelessWidget {
  const CardForumType({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.only(top: 32, bottom: 32, left: 16, right: 16),
      child: Row(
        children: [
          Icon(
            Icons.feedback,
            size: 50,
            color: ColorsConstant.primaryColor,
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
