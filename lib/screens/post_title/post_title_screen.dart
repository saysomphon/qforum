import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qfoumn/screens/post_title/widgets/card_post_title.dart';

class PostTitleScreen extends StatefulWidget {
  const PostTitleScreen(
      {super.key, required this.forumTypeId, required this.title});
  final String forumTypeId;
  final String title;

  @override
  State<PostTitleScreen> createState() => _PostTitleScreenState();
}

class _PostTitleScreenState extends State<PostTitleScreen> {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _postStream = FirebaseFirestore.instance
        .collection("post")
        .where("forum_type_id", isEqualTo: widget.forumTypeId)
        .snapshots();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _postStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: CardPostTitle(
                    title: data['title'],
                    author: data['email'],
                    createdTime: data['created_at'],
                    isAnonymous: data['is_anonymous']),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
