import 'package:flutter/material.dart';
import 'package:qfoumn/model/post.dart';
import 'package:qfoumn/widgets/author.dart';

import '../../../constants/colors.dart';

class TitleContainer extends StatelessWidget {
  const TitleContainer({super.key, required this.post});

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorsConstant.darkPrimaryColor,
        border: Border.all(color: ColorsConstant.borderColor, width: 1),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.title,
              style: TextStyle(
                  color: ColorsConstant.textYellowColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Author(text: post.isAnonymous ? 'anonymous' : post.email),
            const SizedBox(height: 15),
            Text(
              post.content,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                post.createdAt,
                style: TextStyle(color: ColorsConstant.textAuthorColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
