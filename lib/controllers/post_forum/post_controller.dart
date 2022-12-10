import 'package:get/get.dart';
import 'package:flutter/material.dart';

class PostForumController extends GetxController {
  Rx<TextEditingController> commentController =
      TextEditingController(text: "").obs;
}
