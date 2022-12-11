import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qfoumn/model/post.dart';
import 'package:qfoumn/screens/add_post_title/add_post_title.dart';
import 'package:qfoumn/screens/post_title/widgets/card_post_title.dart';
import 'package:qfoumn/widgets/floating_add_button.dart';
import 'package:qfoumn/widgets/loading_get_data.dart';
import 'package:qfoumn/widgets/something_went_wrong.dart';

class PostTitleScreen extends StatefulWidget {
  const PostTitleScreen(
      {super.key, required this.forumTypeId, required this.title});
  final String forumTypeId;
  final String title;

  @override
  State<PostTitleScreen> createState() => _PostTitleScreenState();
}

class _PostTitleScreenState extends State<PostTitleScreen> {
  /// Go to post screen that will create a post and come back to this screen to see a new post
  void gotoAddPostScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddPostTitleScreen(
          forumId: widget.forumTypeId,
          forumTitle: widget.title,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> postStream = FirebaseFirestore.instance
        .collection("post")
        .where("forum_type_id", isEqualTo: widget.forumTypeId)
        .snapshots();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: postStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const SomethingWentWrong();
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingGetData();
          }

          return buildListPostCard(snapshot);
        },
      ),
      floatingActionButton: FloatingAddButton(onPressed: gotoAddPostScreen),
    );
  }

  ListView buildListPostCard(AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
    return ListView(
      children: snapshot.data!.docs.map((DocumentSnapshot document) {
        Map<String, dynamic> getData = document.data()! as Map<String, dynamic>;
        getData['id'] = document.id;
        PostModel data = postModelFromJson(getData);
        return CardPostTitle(
          forumType: widget.title,
          post: PostModel(
              id: data.id,
              createdAt: data.createdAt,
              content: data.content,
              email: data.email,
              forumTypeId: data.forumTypeId,
              isAnonymous: data.isAnonymous,
              title: data.title),
        );
      }).toList(),
    );
  }
}
