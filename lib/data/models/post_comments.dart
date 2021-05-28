class PostComment {
  String id;
  String commenterId;
  String commenterName;
  String comment;
  String time;
  int likes;
  int replies;
  PostComment.fromJson(Map comment)
      : id = comment['id'],
        commenterId = comment["commenter_id"],
        commenterName = comment['commenter_name'],
        time = comment['time'],
        comment = comment['comment'],
        likes = comment['likes'],
        replies = comment['replies'];
}
