class LikeCommentCount {
  String likes;
  String comments;
  LikeCommentCount.fromJson(Map statJson)
      : likes = statJson['likes'],
        comments = statJson['comments'];
}
