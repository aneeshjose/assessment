import 'package:bluepad_assessment/cubit/comment_cubit.dart';
import 'package:bluepad_assessment/presentation/screens/components/comment_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlogComments extends StatelessWidget {
  final String id;

  const BlogComments({Key key, this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CommentCubit>(context).fetchComments(id);
    return BlocBuilder<CommentCubit, CommentState>(builder: (context, state) {
      if (!(state is CommentsLoaded))
        return Center(child: CircularProgressIndicator());
      final comments = (state as CommentsLoaded).comments;
      return Column(
        children: comments
            .map((comment) => CommentUI(
                  comment: comment,
                ))
            .toList(),
      );
      // return ListView.builder(
      //   itemCount: comments.length,
      //   itemBuilder: (context, index) => CommentUI(
      //     comment: comments[index],
      //   ),
      // );
    });
  }
}
