class LikeCommentCount {
  int likes;
  int comments;
  LikeCommentCount.fromJson(Map statJson)
      : likes = statJson['likes'],
        comments = statJson['comments'];
}
