import 'package:bloc/bloc.dart';
import 'package:bluepad_assessment/data/models/like_comment_count.dart';
import 'package:bluepad_assessment/data/post_repository.dart';
import 'package:meta/meta.dart';

part 'like_comment_count_state.dart';

class LikeCommentCountCubit extends Cubit<LikeCommentCountState> {
  final Repository repository;

  LikeCommentCountCubit({this.repository}) : super(LikeCommentCountInitial());

  void fetchLikeComments(String postId) {
    repository.fetchLikesAndCommentOfPost(postId);
  }
}
