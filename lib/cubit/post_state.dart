part of 'post_cubit.dart';

@immutable
abstract class PostState {}

class PostInitial extends PostState {}

class PostLoaded extends PostState {
  final Post post;

  PostLoaded({this.post});
}

class AddBottomButtons extends PostState {}

class RemoveBottomButtons extends PostState {}
