import 'package:flutter/material.dart';
import 'package:qfoumn/constants/colors.dart';

class Comment extends StatefulWidget {
  const Comment({super.key});
  @override
  State<Comment> createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstant.primaryColor,
      appBar: AppBar(
        elevation: 0,
        title: const Text("Comment"),
        leading: const Icon(Icons.arrow_back_ios_new_rounded),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: const [
              Text(
                "Title:",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              TextField(),
              Text(
                "Content:",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
