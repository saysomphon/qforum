import 'package:flutter/material.dart';
import 'package:qfoumn/constants/colors.dart';
import 'package:qfoumn/constants/padding.dart';
import 'package:qfoumn/screens/post_title/post_title_screen.dart';

class CardForumType extends StatelessWidget {
  const CardForumType({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PostTitleScreen(
              forumTypeId: "test",
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        padding:
            const EdgeInsets.only(top: 32, bottom: 32, left: 16, right: 16),
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
      ),
    );
  }
}
