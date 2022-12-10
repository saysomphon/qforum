import 'package:flutter/material.dart';
import 'package:qfoumn/constants/colors.dart';
import 'package:qfoumn/model/post.dart';
import 'package:qfoumn/screens/post/post_screen.dart';

class CardPostTitle extends StatelessWidget {
  const CardPostTitle({super.key, required this.post, required this.forumType});

  final PostModel post;
  final String forumType;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PostScreen(
              post: post,
              forumTitle: forumType,
            ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(color: ColorsConstant.dividerColor),
          Padding(
            padding: const EdgeInsets.only(
                left: 16.0, right: 16.0, top: 16.0, bottom: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                  child: Text(
                    post.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(
                          'User: ${post.isAnonymous ? 'anonymous' : post.email}',
                          style:
                              TextStyle(color: ColorsConstant.textLightGrey)),
                    ),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                        text: '${post.createdAt}  ',
                        style: TextStyle(color: ColorsConstant.textLightGrey),
                      ),
                      WidgetSpan(
                          child: Icon(
                        Icons.chat_bubble,
                        color: ColorsConstant.textLightGrey,
                      ))
                    ]))
                  ],
                ),
              ],
            ),
          ),
          Divider(color: ColorsConstant.dividerColor),
        ],
      ),
    );
  }
}
