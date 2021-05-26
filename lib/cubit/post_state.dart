part of 'post_cubit.dart';

@immutable
abstract class PostState {}

@immutable
abstract class CommentState {}

class PostInitial extends PostState {}

class PostLoaded extends PostState {
  final Post post;

  PostLoaded({this.post});
}

class CommentsLoaded extends CommentState {
  final List<PostComments> comments;

  CommentsLoaded({this.comments});
}
