class LikeCommentCount {
  String likes;
  String comments;
  LikeCommentCount.fromJson(Map statJson)
      : likes = statJson['likes']?.toString(),
        comments = statJson['comments']?.toString();
}
