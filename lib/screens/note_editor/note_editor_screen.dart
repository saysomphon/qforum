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
  final _formKey = GlobalKey<FormState>();

  /// create sticky note for brainstorming post-it
  void addNote() {
    if (_formKey.currentState!.validate()) {
      CollectionReference post =
          FirebaseFirestore.instance.collection('brainstorm_post_it');
      post.add({
        "created_at": DateTime.now().toString(),
        "content": contentController.value.text,
        "title": titleController.value.text,
        "time": DateTime.now()
      }).then((value) {
        titleController.text = '';
        titleController.text = '';
        Navigator.pop(context);
      }).catchError((error) {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Note"),
        centerTitle: true,
      ),
      backgroundColor: ColorsConstant.textYellowColor,
      body: Padding(
        padding: const EdgeInsets.all(PaddingConstant.scaffoldPadding),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Note Title';
                    }
                    return null;
                  },
                  controller: titleController,
                  decoration: InputDecoration(
                      hintText: "Note Title",
                      hintStyle:
                          TextStyle(color: ColorsConstant.textAuthorColor),
                      border: InputBorder.none,
                      filled: false),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Note content';
                    }
                    return null;
                  },
                  controller: contentController,
                  keyboardType: TextInputType.multiline,
                  maxLines: 10,
                  decoration: InputDecoration(
                      filled: false,
                      hintStyle:
                          TextStyle(color: ColorsConstant.textAuthorColor),
                      border: InputBorder.none,
                      hintText: "Note content"),
                ),
              ],
            ),
          ),
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
