import 'package:bluepad_assessment/data/models/post_comments.dart';
import 'package:bluepad_assessment/data/post_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'comment_state.dart';

class CommentCubit extends Cubit<CommentState> {
  final Repository repository;
  CommentCubit({this.repository}) : super(CommentInitial());

  void fetchComments(String postId) {
    repository
        .fetchCommentsFromMock(postId)
        .then((comments) => CommentsLoaded(comments: comments));
  }
}
