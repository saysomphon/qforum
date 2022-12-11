import 'package:flutter/material.dart';
import 'package:qfoumn/constants/colors.dart';
import 'package:qfoumn/screens/post_title/post_title_screen.dart';

class CardForumType extends StatelessWidget {
  const CardForumType(
      {super.key, required this.title, required this.id, required this.icon});
  final String title;
  final String id;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    void viewPostTitle() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PostTitleScreen(
            forumTypeId: id,
            title: title,
          ),
        ),
      );
    }

    return InkWell(
      onTap: viewPostTitle,
      child: Container(
        decoration: BoxDecoration(
          color: ColorsConstant.primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        padding:
            const EdgeInsets.only(top: 20, bottom: 20, left: 16, right: 16),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0)),
              child: Icon(
                icon,
                size: 40,
                color: ColorsConstant.secondaryColor,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: ColorsConstant.textColor),
            )
          ],
        ),
      ),
    );
  }
}
