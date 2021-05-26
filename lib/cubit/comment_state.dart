part of 'comment_cubit.dart';

@immutable
abstract class CommentState {}

class CommentInitial extends CommentState {}

class CommentsLoaded extends CommentState {
  final List<PostComment> comments;

  CommentsLoaded({this.comments});
}
