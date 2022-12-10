import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qfoumn/constants/colors.dart';
import 'package:qfoumn/constants/padding.dart';
import 'package:qfoumn/widgets/send_button.dart';

class AddCommentScreen extends StatefulWidget {
  const AddCommentScreen({super.key, required this.postId});

  final String postId;

  @override
  State<AddCommentScreen> createState() => _AddCommentScreenState();
}

class _AddCommentScreenState extends State<AddCommentScreen> {
  String errorMessage = "";
  final contentController = TextEditingController();
  bool loading = false;

  CollectionReference comment =
      FirebaseFirestore.instance.collection('comment');

  bool formValid() {
    if (contentController.text.isEmpty) {
      setState(() {
        errorMessage = "Please enter comment";
      });
      return false;
    }
    setState(() {
      errorMessage = "";
    });
    return true;
  }

  Future<void> addComment() {
    // Call the user's CollectionReference to add a new user
    setState(() {
      loading = true;
    });
    return comment.add({
      'created_at': '10/12/2022',
      'email': 'ting@gmail.com',
      'is_anonymous': false,
      'message': contentController.text,
      'post_id': widget.postId
    }).then((value) {
      setState(() {
        loading = false;
      });
      Navigator.pop(context);
    }).catchError((error) {
      setState(() {
        errorMessage = "Something when wrong please try again later";
      });
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(PaddingConstant.scaffoldPadding),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: contentController,
                  keyboardType: TextInputType.multiline,
                  style: TextStyle(color: Colors.white),
                  maxLines: 10,
                  decoration: InputDecoration(
                    hintText: 'Write comment here',
                    hintStyle: TextStyle(color: ColorsConstant.textLightGrey),
                    border: InputBorder.none,
                    fillColor: ColorsConstant.darkPrimaryColor,
                    filled: true,
                  ),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: SendButton(tilte: 'Send', press: addComment),
                ),
                if (errorMessage.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        errorMessage,
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
