import 'package:flutter/material.dart';
import 'package:qfoumn/constants/colors.dart';
import 'package:qfoumn/constants/padding.dart';
import 'package:qfoumn/model/post.dart';
import 'package:qfoumn/screens/post/post_screen.dart';

class CardPostTitle extends StatelessWidget {
  const CardPostTitle({super.key, required this.post, required this.forumType});

  final PostModel post;
  final String forumType;

  @override
  Widget build(BuildContext context) {
    void seePostDetail() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PostScreen(
            post: post,
            forumTitle: forumType,
          ),
        ),
      );
    }

    return InkWell(
      onTap: seePostDetail,
      child: Padding(
        padding: const EdgeInsets.all(PaddingConstant.scaffoldPadding),
        child: Container(
          decoration: BoxDecoration(
            color: ColorsConstant.primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50,
                      child: Text(
                        post.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(children: [
                            WidgetSpan(
                                child: Icon(
                              Icons.person,
                              color: ColorsConstant.darkPrimaryColor,
                              size: 25,
                            )),
                            TextSpan(
                                text:
                                    post.isAnonymous ? 'anonymous' : post.email,
                                style: TextStyle(
                                    color: ColorsConstant.darkPrimaryColor))
                          ]),
                        ),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                            text: '${post.createdAt}  ',
                            style:
                                TextStyle(color: ColorsConstant.textLightGrey),
                          ),
                        ]))
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
