part of 'likecommentcount_cubit.dart';

@immutable
abstract class LikeCommentCountState {}

class LikeCommentCountInitial extends LikeCommentCountState {}

class LikeLoading extends LikeCommentCountState {}

class CommentLoading extends LikeCommentCountState {}

class LikeCommentCountLoaded extends LikeCommentCountState {
  final LikeCommentCount stat;

  LikeCommentCountLoaded(this.stat);
}
