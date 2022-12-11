import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qfoumn/constants/colors.dart';
import 'package:qfoumn/utils/date_format.dart';

Widget noteCard(Function()? onTop, QueryDocumentSnapshot doc) {
  return InkWell(
    onTap: onTop,
    child: Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.yellow, borderRadius: BorderRadius.circular(8.0)),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              doc["title"],
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 5),
            Text(
              DateTimeFormatConvert.convertDateFormat(
                  datetime: doc['created_at'], format: 'dd/MM/yyyy hh:mm'),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                  color: ColorsConstant.textAuthorColor),
            ),
            const SizedBox(height: 20),
            Text(
              doc["content"],
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    ),
  );
}
