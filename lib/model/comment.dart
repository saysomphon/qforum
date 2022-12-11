import 'dart:convert';

import 'package:qfoumn/utils/date_format.dart';

CommentModel commentModelFromJson(Map<String, dynamic> json) =>
    CommentModel.fromJson(json);
String commentModelToJson(CommentModel data) => json.encode(data.toJson());

class CommentModel {
  CommentModel(
      {required this.createdAt,
      required this.email,
      required this.id,
      required this.isAnonymous,
      required this.message});

  final String createdAt;
  final String email;
  final bool isAnonymous;
  final String message;
  final String id;

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
        createdAt: DateTimeFormatConvert.convertDateFormat(
            datetime: json['created_at'], format: 'dd/MM/yyyy hh:mm'),
        email: json["email"] as String,
        isAnonymous: json["is_anonymous"] as bool,
        id: json["id"] as String,
        message: json["message"] as String,
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt,
        "email": email,
        "message": message,
        "is_anonymous": isAnonymous,
        "id": id
      };
}
