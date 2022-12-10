import 'package:flutter/material.dart';
import 'package:qfoumn/constants/colors.dart';
import 'package:qfoumn/widgets/expand_text_field.dart';
import 'package:qfoumn/widgets/send_button.dart';

class Comment extends StatelessWidget {
  const Comment({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controllerContent = TextEditingController();
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
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ExpandTextField(
                    contentSize: 16,
                    textController: _controllerContent,
                    hintText: 'Enter your comment',
                  ),
                  const SizedBox(height: 16),
                  Align(
                      alignment: Alignment.centerRight,
                      child: SendButton(
                        tilte: 'Post',
                        press: () {
                          print(_controllerContent.text);
                        },
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
