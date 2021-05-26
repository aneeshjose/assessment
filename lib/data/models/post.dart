import 'package:bluepad_assessment/data/models/post_description.dart';

class Post {
  String id;
  int likeCount;
  int commentCount;
  String primaryTitle;
  String primaryDescription;
  String userId;
  String userName;
  String time;
  List<PostSubDescription> subDescriptions;

  Post.fromJson(Map postJson)
      : id = postJson["id"],
        primaryTitle = postJson["primary_title"],
        time = postJson['time'],
        primaryDescription = postJson['primary_description'],
        likeCount = postJson['like_count'] as int,
        commentCount = postJson['comment_count'] as int,
        userId = postJson['user_id'],
        userName = postJson['user_name'],
        subDescriptions = List.generate(
            postJson['secondary_description'].length,
            (index) => PostSubDescription.fromJson(
                postJson['secondary_description'][index])).toList();
}
