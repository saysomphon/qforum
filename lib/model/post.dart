class PostModel {
  final String id;
  final String createdAt;
  final String description;
  final String email;
  final String forumTypeId;
  final bool isAnonymous;
  final String title;
  PostModel(
      {required this.id,
      required this.createdAt,
      required this.description,
      required this.email,
      required this.forumTypeId,
      required this.isAnonymous,
      required this.title});
}
