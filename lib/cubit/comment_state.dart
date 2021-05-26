part of 'comment_cubit.dart';

@immutable
abstract class CommentState {}

class CommentInitial extends CommentState {}

class CommentsLoaded extends CommentState {
  final List<PostComments> comments;

  CommentsLoaded({this.comments});
}
