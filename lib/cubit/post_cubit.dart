import 'package:bloc/bloc.dart';
import 'package:bluepad_assessment/data/models/post.dart';
import 'package:bluepad_assessment/data/post_repository.dart';
import 'package:meta/meta.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  final Repository repository;
  PostCubit({this.repository}) : super(PostInitial());

  void fetchPost() {
    repository.fetchPostFromMock().then(
          (post) => emit(PostLoaded(post: post)),
        );
  }
}
