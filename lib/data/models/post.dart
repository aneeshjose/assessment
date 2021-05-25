import 'package:bluepad_assessment/data/models/post_description.dart';

class Post {
  String id;
  int likeCount;
  int commentCount;
  String primaryTitle;
  String primaryDescription;
  List<PostSubDescription> subDescriptions;

  Post.fromJson(Map postJson)
      : id = postJson["id"],
        primaryTitle = postJson["priamary_title"],
        primaryDescription = postJson['primary_description'],
        likeCount = postJson['like_count'] as int,
        commentCount = postJson['comment_count'] as int,
        subDescriptions = List.generate(
            postJson['secondary_description'].length,
            (index) => PostSubDescription.fromJson(
                postJson['secondary_description'][index])).toList();
}
