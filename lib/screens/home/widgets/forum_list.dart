import 'package:flutter/material.dart';
import 'package:qfoumn/constants/padding.dart';
import 'package:qfoumn/screens/home/data/data_forum_type.dart';
import 'package:qfoumn/screens/home/widgets/card_forum_type.dart';

class ForumList extends StatelessWidget {
  const ForumList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: DataForumType.data.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(PaddingConstant.scaffoldPadding),
        child: CardForumType(
          title: DataForumType.data[index].name,
          id: DataForumType.data[index].id,
          icon: DataForumType.data[index].icon,
        ),
      ),
    );
  }
}
