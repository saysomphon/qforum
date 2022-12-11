import 'dart:convert';

import 'package:qfoumn/utils/date_format.dart';

BrainstormPostItModel brainstormPostItModelFromJson(
        Map<String, dynamic> json) =>
    BrainstormPostItModel.fromJson(json);
String brainstormPostItModelToJson(BrainstormPostItModel data) =>
    json.encode(data.toJson());

class BrainstormPostItModel {
  BrainstormPostItModel({
    required this.createdAt,
    required this.title,
    required this.id,
    required this.content,
  });

  final String createdAt;
  final String title;
  final String content;
  final String id;

  factory BrainstormPostItModel.fromJson(Map<String, dynamic> json) =>
      BrainstormPostItModel(
        createdAt: DateTimeFormatConvert.convertDateFormat(
            datetime: json['created_at'], format: 'dd/MM/yyyy hh:mm'),
        title: json["title"] as String,
        content: json["content"] as String,
        id: json["id"] as String,
      );

  Map<String, dynamic> toJson() =>
      {"created_at": createdAt, "content": content, "title": title, "id": id};
}
