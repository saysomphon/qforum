import 'package:flutter/material.dart';
import 'package:qfoumn/widgets/author.dart';

import '../../../constants/colors.dart';
import '../../../utils/date_format.dart';

class CardComment extends StatelessWidget {
  const CardComment(
      {super.key,
      required this.comment,
      required this.author,
      required this.sentTime,
      required this.isAnonymous});
  final String comment;
  final String author;
  final String sentTime;
  final bool isAnonymous;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 5),
      width: double.infinity,
      decoration: BoxDecoration(
        color: isAnonymous
            ? ColorsConstant.darkPrimaryColor
            : ColorsConstant.primaryColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(comment,
                style: TextStyle(
                    color: ColorsConstant.textColor,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Author(text: isAnonymous ? 'anonymous' : author),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                      DateTimeFormatConvert.convertDateFormat(
                          datetime: sentTime, format: "dd/MM/yyyy hh:mm"),
                      style: TextStyle(color: ColorsConstant.textAuthorColor)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
