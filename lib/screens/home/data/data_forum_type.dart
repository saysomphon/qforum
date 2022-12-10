import 'package:flutter/material.dart';
import 'package:qfoumn/model/forum_type.dart';

class DataForumType {
  static List<ForumType> data = [
    ForumType(id: 'feedback', name: "Feedback", icon: Icons.feedback),
    ForumType(id: 'share_idea', name: "Share Idea", icon: Icons.lightbulb),
    ForumType(id: 'event_board', name: "Event Board", icon: Icons.event),
    ForumType(id: 'community', name: "Community", icon: Icons.people),
  ];
}
