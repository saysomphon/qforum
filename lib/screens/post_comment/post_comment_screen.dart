import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qfoumn/constants/colors.dart';
import 'package:qfoumn/widgets/expand_text_field.dart';
import 'package:qfoumn/widgets/send_button.dart';

class PostComment extends StatefulWidget {
  const PostComment({super.key});
  @override
  State<PostComment> createState() => _PostCommentState();
}

class _PostCommentState extends State<PostComment> {
  final TextEditingController _controllerTitle = TextEditingController();
  final TextEditingController _controllerContent = TextEditingController();
  CollectionReference post = FirebaseFirestore.instance.collection('post');

  final _currentUser = FirebaseAuth.instance.currentUser;

  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: ColorsConstant.primaryColor,
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            "Post Comment",
            style: TextStyle(fontSize: 25),
          ),
          leading: const Icon(Icons.arrow_back_ios_new_rounded),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Title:",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ExpandTextField(
                    contentSize: 20,
                    textController: _controllerTitle,
                    hintText: 'Enter your title',
                  ),
                  const SizedBox(height: 16),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Content:",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ExpandTextField(
                    contentSize: 18,
                    textController: _controllerContent,
                    hintText: 'Enter your content',
                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: SendButton(
                      tilte: 'Post',
                      press: () async {
                        await post.doc().set(
                          {
                            'create_at': dateTime,
                            'title': _controllerTitle.text,
                            'description': _controllerContent.text,
                            'forum_type_id': '',
                            'is_anonymous': false,
                            'user_id': _currentUser!.uid,
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
