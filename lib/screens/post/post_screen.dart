import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qfoumn/constants/colors.dart';
import 'package:qfoumn/model/post.dart';
import 'package:qfoumn/screens/add_comment/add_comment_screen.dart';
import 'package:qfoumn/screens/post/widgets/card_comment.dart';
import 'package:qfoumn/screens/post/widgets/header.dart';
import 'package:qfoumn/widgets/floating_add_button.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key, required this.post, required this.forumTitle});

  final PostModel post;
  final String forumTitle;

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _commentStream = FirebaseFirestore.instance
        .collection("comment")
        .where("post_id", isEqualTo: widget.post.id)
        .snapshots();

    void goToAddCommentScreen() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AddCommentScreen(postId: widget.post.id),
        ),
      );
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        // resizeToAvoidBottomInset: true,

        appBar: AppBar(
          title: Text(widget.forumTitle),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleContainer(
                  post: widget.post,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 10, left: 5),
                  child: Text(
                    'Comments',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: _commentStream,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return const Text('Something went wrong');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      );
                    }

                    return Column(
                      children: [
                        ...snapshot.data!.docs.map((DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data()! as Map<String, dynamic>;
                          return Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: CardComment(
                                comment: data['message'],
                                author: data['email'],
                                sentTime: data['created_at'],
                                isAnonymous: data['is_anonymous']),
                          );
                        }).toList()
                      ],
                    );
                  },
                )
              ],
            ),
          ),
        ),
        floatingActionButton:
            FloatingAddButton(onPressed: goToAddCommentScreen),
      ),
    );
  }
}
