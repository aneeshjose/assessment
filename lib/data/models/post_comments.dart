class PostComments {
  String id;
  String commenterId;
  String commenterName;
  String comment;
  PostComments.fromJson(Map comment)
      : id = comment['id'],
        commenterId = comment["commenter_id"],
        commenterName = comment['commenter_name'],
        comment = comment['comment'];
}
