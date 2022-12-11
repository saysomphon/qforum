import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostTitleController extends GetxController {
  Rx<TextEditingController> titleController = TextEditingController().obs;
  Rx<TextEditingController> contentController = TextEditingController().obs;
  RxString errorMessage = "".obs;
  RxBool loading = false.obs;

  /// create post title to database
  void addPostTitle(
      {required BuildContext context,
      required String email,
      required String forumTypeId,
      required bool isAnonymous}) {
    CollectionReference post = FirebaseFirestore.instance.collection('post');
    loading.value = true;
    post.add({
      "created_at": DateTime.now().toString(),
      "content": contentController.value.text,
      "email": email,
      "forum_type_id": forumTypeId,
      "is_anonymous": isAnonymous,
      "title": titleController.value.text
    }).then((value) {
      loading.value = false;
      contentController.value.text = '';
      titleController.value.text = '';
      Navigator.pop(context);
    }).catchError((error) {
      loading.value = false;
    });
  }
}
