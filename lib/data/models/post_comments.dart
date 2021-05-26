class PostComment {
  String id;
  String commenterId;
  String commenterName;
  String comment;
  PostComment.fromJson(Map comment)
      : id = comment['id'],
        commenterId = comment["commenter_id"],
        commenterName = comment['commenter_name'],
        comment = comment['comment'];
}
