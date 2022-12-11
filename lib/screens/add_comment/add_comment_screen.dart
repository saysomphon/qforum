import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qfoumn/constants/colors.dart';
import 'package:qfoumn/constants/padding.dart';
import 'package:qfoumn/widgets/submit_button.dart';

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
  bool isAnonymous = false;
  var getUser = FirebaseAuth.instance.currentUser;
  final _formKey = GlobalKey<FormState>();

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
      'created_at': DateTime.now().toString(),
      'email': getUser!.email ?? "",
      'is_anonymous': isAnonymous,
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
        appBar: AppBar(
          title: const Text("Comment"),
          centerTitle: true,
          actions: [
            Row(
              children: [
                Image.asset(
                  'assets/images/incognito.png',
                  scale: 1.6,
                  color: ColorsConstant.darkPrimaryColor,
                ),
                Switch(
                  // This bool value toggles the switch.
                  value: isAnonymous,
                  activeColor: ColorsConstant.darkPrimaryColor,
                  onChanged: (bool value) {
                    // This is called when the user toggles the switch.
                    setState(() {
                      isAnonymous = value;
                    });
                  },
                ),
              ],
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(PaddingConstant.scaffoldPadding),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter comment';
                      }
                      return null;
                    },
                    controller: contentController,
                    keyboardType: TextInputType.multiline,
                    maxLines: 10,
                    decoration: const InputDecoration(
                      hintText: 'Write comment here',
                    ),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerRight,
                    child: SubmitButton(
                        tilte: 'Comment',
                        press: () {
                          if (_formKey.currentState!.validate()) {
                            addComment();
                          }
                        }),
                  ),
                  if (errorMessage.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          errorMessage,
                          style: const TextStyle(color: Colors.red),
                        ),
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
