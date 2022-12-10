import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:qfoumn/constants/colors.dart';
import 'package:qfoumn/constants/padding.dart';
import 'package:qfoumn/controllers/post_title.dart';
import 'package:qfoumn/controllers/user.dart';
import 'package:qfoumn/widgets/send_button.dart';

class AddPostTitleScreen extends StatefulWidget {
  const AddPostTitleScreen(
      {super.key, required this.forumId, required this.forumTitle});

  final String forumId;
  final String forumTitle;

  @override
  State<AddPostTitleScreen> createState() => _AddPostTitleScreenState();
}

class _AddPostTitleScreenState extends State<AddPostTitleScreen> {
  PostTitleController postTitleController = Get.put(PostTitleController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.forumTitle),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(PaddingConstant.scaffoldPadding),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Title',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: postTitleController.titleController.value,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Write title here',
                    hintStyle: TextStyle(color: ColorsConstant.textLightGrey),
                    border: InputBorder.none,
                    fillColor: ColorsConstant.darkPrimaryColor,
                    filled: true,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  'Content',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: postTitleController.contentController.value,
                  keyboardType: TextInputType.multiline,
                  style: TextStyle(color: Colors.white),
                  maxLines: 10,
                  decoration: InputDecoration(
                    hintText: 'Write content here',
                    hintStyle: TextStyle(color: ColorsConstant.textLightGrey),
                    border: InputBorder.none,
                    fillColor: ColorsConstant.darkPrimaryColor,
                    filled: true,
                  ),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: SendButton(
                      tilte: 'Post',
                      press: () => postTitleController.addPostTitle(
                          context: context,
                          email: 'email@gmail.com',
                          forumTypeId: widget.forumId,
                          isAnonymous: false)),
                ),
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        postTitleController.errorMessage.value,
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
