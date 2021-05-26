import 'package:bluepad_assessment/cubit/like_comment_count_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomActionButtons extends StatelessWidget {
  final String postId;

  const BottomActionButtons({Key key, this.postId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<LikeCommentCountCubit>(context).fetchLikeComments(postId);
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: InkWell(
              onTap: () => BlocProvider.of<LikeCommentCountCubit>(context)
                  .addLike(postId),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                child: Icon(Icons.thumb_up),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () => BlocProvider.of<LikeCommentCountCubit>(context)
                  .addComment(postId),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                child: Icon(Icons.comment),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              // onTap: () => ,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                child: Icon(Icons.share),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              // onTap: () => ,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                child: Icon(Icons.download_outlined),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
