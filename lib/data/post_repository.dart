import 'package:bluepad_assessment/data/mock_network_service.dart';
import 'package:bluepad_assessment/data/models/like_comment_count.dart';
import 'package:bluepad_assessment/data/models/post.dart';
import 'package:bluepad_assessment/data/models/post_comments.dart';

class Repository {
  final MockNetworkService mockNetworkService;
  Repository({this.mockNetworkService});

  Future<Post> fetchPostFromMock(String postId) async {
    final Map posts = await mockNetworkService.fetchPosts(postId);
    return Post.fromJson(posts);
  }

  Future<List<PostComment>> fetchCommentsFromMock(String postId) async {
    final List<Map> comments = await mockNetworkService.fetchComments(postId);
    return comments.map((comment) => PostComment.fromJson(comment)).toList();
  }

  Future<LikeCommentCount> fetchLikesAndCommentOfPost(String postId) async {
    final Map countMap = await mockNetworkService.fetchLikeCommentCount(postId);
    return LikeCommentCount.fromJson(countMap);
  }
}
