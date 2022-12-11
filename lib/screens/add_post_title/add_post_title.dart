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
  bool isAnonymous = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.forumTitle),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Title',
                  style: TextStyle(
                      color: ColorsConstant.textColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                TextField(
                    controller: postTitleController.titleController.value,
                    decoration:
                        const InputDecoration(hintText: "Write title here")),
                const SizedBox(height: 15),
                Text(
                  'Content',
                  style: TextStyle(
                      color: ColorsConstant.textColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: postTitleController.contentController.value,
                  maxLines: 10,
                  keyboardType: TextInputType.multiline,
                  decoration:
                      const InputDecoration(hintText: "Write content here"),
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
                          isAnonymous: isAnonymous)),
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

  TextField buildTextFieldContent() {
    return TextField(
      controller: postTitleController.contentController.value,
      keyboardType: TextInputType.multiline,
      style: TextStyle(color: ColorsConstant.darkPrimaryColor),
      maxLines: 10,
      decoration: InputDecoration(
        hintText: 'Write content here',
        hintStyle: const TextStyle(color: Colors.white),
        border: InputBorder.none,
        fillColor: ColorsConstant.primaryColor,
        filled: true,
      ),
    );
  }
}
