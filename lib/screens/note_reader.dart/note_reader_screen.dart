import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qfoumn/constants/colors.dart';
import 'package:qfoumn/constants/padding.dart';
import 'package:qfoumn/model/brainstorm_post_it.dart';

class NoteReaderScreen extends StatefulWidget {
  const NoteReaderScreen({super.key, required this.doc});

  final QueryDocumentSnapshot doc;

  @override
  State<NoteReaderScreen> createState() => _NoteReaderScreenState();
}

class _NoteReaderScreenState extends State<NoteReaderScreen> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> getData = widget.doc.data()! as Map<String, dynamic>;
    getData['id'] = widget.doc.id;
    BrainstormPostItModel data = brainstormPostItModelFromJson(getData);
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: ColorsConstant.textYellowColor,
      body: Padding(
        padding: const EdgeInsets.all(PaddingConstant.scaffoldPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            const SizedBox(height: 20),
            Text(
              data.content,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
