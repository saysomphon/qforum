import 'package:flutter/material.dart';

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
        border: Border.all(color: ColorsConstant.borderColor, width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
            left: 16.0, right: 16.0, top: 16.0, bottom: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              comment,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Text(isAnonymous ? 'User: Anonymous' : 'User: $author',
                      style: TextStyle(color: ColorsConstant.textLightGrey)),
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: DateTimeFormatConvert.convertDateFormat(
                        datetime: sentTime, format: "dd/MM/yyyy hh:mm"),
                    style: TextStyle(color: ColorsConstant.textLightGrey),
                  ),
                ]))
              ],
            )
          ],
        ),
      ),
    );
  }
}
