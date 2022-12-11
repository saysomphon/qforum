import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:qfoumn/constants/colors.dart';
import 'package:qfoumn/constants/padding.dart';
import 'package:qfoumn/controllers/post_title.dart';
import 'package:qfoumn/widgets/submit_button.dart';

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
  var getUser = FirebaseAuth.instance.currentUser;

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
                const Text(
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
                  style: const TextStyle(color: Colors.white),
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
                  child: SubmitButton(
                      tilte: 'Post',
                      press: () => postTitleController.addPostTitle(
                          context: context,
                          email: getUser!.email ?? "",
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
                        style: const TextStyle(color: Colors.red),
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
