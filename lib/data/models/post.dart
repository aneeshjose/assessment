import 'package:bluepad_assessment/data/models/post_description.dart';

class Post {
  String id;
  String primaryTitle;
  String primaryDescription;
  List<PostSubDescription> subDescriptions;

  Post.fromJson(Map postJson)
      : id = postJson["id"],
        primaryTitle = postJson["priamary_title"],
        primaryDescription = postJson['primary_description'],
        subDescriptions = List.generate(
            postJson['secondary_description'].length,
            (index) => PostSubDescription.fromJson(
                postJson['secondary_description'][index])).toList();
}
