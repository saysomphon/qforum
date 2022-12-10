import 'package:flutter/material.dart';
import 'package:qfoumn/constants/colors.dart';
import 'package:qfoumn/widgets/expand_text_field.dart';
import 'package:qfoumn/widgets/send_button.dart';

class Comment extends StatefulWidget {
  const Comment({super.key});
  @override
  State<Comment> createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  final TextEditingController _controllerTitle = TextEditingController();
  final TextEditingController _controllerContent = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: ColorsConstant.primaryColor,
        appBar: AppBar(
          elevation: 0,
          title: const Text("Comment"),
          leading: const Icon(Icons.arrow_back_ios_new_rounded),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Title:",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                ExpandTextField(
                  contentSize: 20,
                  textController: _controllerTitle,
                  hintText: 'Enter your title',
                ),
                const SizedBox(
                  height: 16,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Content:",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                ExpandTextField(
                  contentSize: 16,
                  textController: _controllerContent,
                  hintText: 'Enter your content',
                ),
                const SizedBox(height: 16),
                Align(
                    alignment: Alignment.centerRight,
                    child: SendButton(
                      tilte: 'Post',
                      press: () {
                        print(_controllerTitle.text);
                        print(_controllerContent.text);
                      },
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//Listener
void restrictCharacters({required TextEditingController controller}) {
  RegExp regexp = RegExp(
    r"^|\-|\,|\ ",
    caseSensitive: false,
    multiLine: false,
  );
  String text = controller.text;
  String chng = text.replaceAll(regexp, "");
  controller.text = chng;
}
