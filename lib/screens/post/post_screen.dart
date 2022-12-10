import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qfoumn/controllers/post_forum/post_controller.dart';
import 'package:qfoumn/screens/post/widgets/card_comment.dart';
import 'package:qfoumn/screens/post/widgets/header.dart';
import 'package:qfoumn/screens/post/widgets/textfield_comment.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});
  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  PostForumController postForumController = Get.put(PostForumController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        // resizeToAvoidBottomInset: true,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text("Feed Back"),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 62, left: 12.0, right: 12.0, top: 12.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TitleContainer(),
                    const Padding(
                      padding: EdgeInsets.only(top: 15, bottom: 10, left: 5),
                      child: Text(
                        'Comments',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                    ...List.generate(
                        10,
                        (index) => const CardComment(
                            comment: "ຂ້ອຍມັກກິນນໍ້າປັ່ນໝາກໄມ້",
                            author: 'ໄຊສົມພອນ ວັນນະແສງ',
                            sentTime: 'Time: 5s ago  ',
                            isSent: true,
                            isUserComment: true))
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: 0,
                child: Obx(() => TextFieldComment(
                    onPressEnter: () {
                      // print(postForumController.commentController.value.text);
                    },
                    commentController:
                        postForumController.commentController.value)))
          ],
        ),
      ),
    );
  }
}
