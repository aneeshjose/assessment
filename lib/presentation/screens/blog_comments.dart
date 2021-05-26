import 'package:bluepad_assessment/cubit/comment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlogComments extends StatelessWidget {
  final String id;

  const BlogComments({Key key, this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CommentCubit>(context).fetchComments(id);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Comments',
          style: TextStyle(color: Colors.blue[200]),
        ),
      ),
    );
  }
}
