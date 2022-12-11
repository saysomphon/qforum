import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qfoumn/constants/colors.dart';
import 'package:qfoumn/model/comment.dart';
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
    final Stream<QuerySnapshot> commentStream = FirebaseFirestore.instance
        .collection("comment")
        .orderBy("time", descending: true)
        .where("post_id", isEqualTo: widget.post.id)
        .snapshots();

    /// go to add comment screen to create a comment and come back to post page to see your new comment
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
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 10, left: 5),
                  child: Text(
                    'Comments',
                    style: TextStyle(
                        color: ColorsConstant.textColor, fontSize: 25),
                  ),
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: commentStream,
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
                          Map<String, dynamic> getData =
                              document.data()! as Map<String, dynamic>;
                          getData['id'] = document.id;
                          CommentModel data = commentModelFromJson(getData);
                          return Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: CardComment(
                                message: data.message,
                                email: data.email,
                                sentTime: data.createdAt,
                                isAnonymous: data.isAnonymous),
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
        floatingActionButton: FloatingAddButton(
          onPressed: goToAddCommentScreen,
        ),
      ),
    );
  }
}
