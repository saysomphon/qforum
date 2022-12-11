import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qfoumn/constants/colors.dart';
import 'package:qfoumn/constants/padding.dart';
import 'package:qfoumn/widgets/floating_add_button.dart';

class NoteEditorScreen extends StatefulWidget {
  const NoteEditorScreen({super.key});

  @override
  State<NoteEditorScreen> createState() => _NoteEditorScreenState();
}

class _NoteEditorScreenState extends State<NoteEditorScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  void addNote() {
    CollectionReference post =
        FirebaseFirestore.instance.collection('brainstorm_post_it');
    post.add({
      "created_at": DateTime.now().toString(),
      "content": contentController.value.text,
      "title": titleController.value.text
    }).then((value) {
      titleController.text = '';
      titleController.text = '';
      Navigator.pop(context);
    }).catchError((error) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Note"),
        centerTitle: true,
      ),
      backgroundColor: ColorsConstant.textYellowColor,
      body: Padding(
        padding: EdgeInsets.all(PaddingConstant.scaffoldPadding),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: "Note Title",
                border: InputBorder.none,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: contentController,
              keyboardType: TextInputType.multiline,
              maxLines: 10,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: "Note content"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingAddButton(
        onPressed: addNote,
        icon: Icons.save,
        iconSize: 35,
      ),
    );
  }
}
