import 'package:flutter/material.dart';
import 'package:qfoumn/constants/colors.dart';

class CardPostTitle extends StatelessWidget {
  const CardPostTitle(
      {super.key,
      required this.title,
      required this.author,
      required this.createdTime,
      required this.isAnonymous});

  final String title;
  final String author;
  final String createdTime;
  final bool isAnonymous;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
                    title,
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
                      child: Text('User: ${isAnonymous ? 'anonymous' : author}',
                          style:
                              TextStyle(color: ColorsConstant.textLightGrey)),
                    ),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                        text: '$createdTime  ',
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
