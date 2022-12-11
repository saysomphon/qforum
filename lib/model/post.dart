import 'dart:convert';

import 'package:qfoumn/utils/date_format.dart';

PostModel postModelFromJson(Map<String, dynamic> json) =>
    PostModel.fromJson(json);
String postModelToJson(PostModel data) => json.encode(data.toJson());

class PostModel {
  PostModel({
    required this.createdAt,
    required this.content,
    required this.email,
    required this.id,
    required this.forumTypeId,
    required this.isAnonymous,
    required this.title,
  });

  final String createdAt;
  final String content;
  final String email;
  final String forumTypeId;
  final bool isAnonymous;
  final String title;
  final String id;

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
      createdAt: DateTimeFormatConvert.convertDateFormat(
          datetime: json['created_at'], format: 'dd/MM/yyyy hh:mm'),
      content: json["content"] as String,
      email: json["email"] as String,
      forumTypeId: json["forum_type_id"] as String,
      isAnonymous: json["is_anonymous"] as bool,
      title: json["title"] as String,
      id: json["id"] as String);

  Map<String, dynamic> toJson() => {
        "created_at": createdAt,
        "content": content,
        "email": email,
        "forum_type_id": forumTypeId,
        "is_anonymous": isAnonymous,
        "title": title,
        "id": id
      };
}
