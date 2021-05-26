import 'package:bluepad_assessment/data/mock_network_service.dart';
import 'package:bluepad_assessment/data/models/post.dart';
import 'package:bluepad_assessment/data/models/post_comments.dart';

class Repository {
  final MockNetworkService mockNetworkService;
  Repository({this.mockNetworkService});
  Future<Post> fetchPostFromMock() async {
    final Map posts = await mockNetworkService.fetchPosts();
    return Post.fromJson(posts);
  }

  Future<List<PostComments>> fetchCommentsFromMock(String postId) async {
    final List<Map> comments = await mockNetworkService.fetchComments(postId);
    print(comments);
    return [];
    // return comments.map((comment) => PostComments.fromJson(comment)).toList();
  }
}
