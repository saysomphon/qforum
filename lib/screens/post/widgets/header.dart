import 'package:flutter/material.dart';
import 'package:qfoumn/model/post.dart';

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
        borderRadius: BorderRadius.circular(5),
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
            Text(
              'User: ${post.email}',
              style: TextStyle(color: ColorsConstant.textLightGrey),
            ),
            const SizedBox(height: 15),
            Text(
              post.description,
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                post.createdAt,
                style: TextStyle(color: ColorsConstant.textLightGrey),
              ),
            )
          ],
        ),
      ),
    );
  }
}
