class PostComment {
  String id;
  String commenterId;
  String commenterName;
  String comment;
  String time;
  PostComment.fromJson(Map comment)
      : id = comment['id'],
        commenterId = comment["commenter_id"],
        commenterName = comment['commenter_name'],
        time = comment['time'],
        comment = comment['comment'];
}
