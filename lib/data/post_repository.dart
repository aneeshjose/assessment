import 'package:bluepad_assessment/data/mock_network_service.dart';
import 'package:bluepad_assessment/data/models/post.dart';

class Repository {
  final MockNetworkService mockNetworkService;
  Repository({this.mockNetworkService});
  Future<Post> fetchPostFromMock() async {
    final Map posts = await mockNetworkService.fetchPosts();
    return Post.fromJson(posts);
  }
}
