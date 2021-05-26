import 'package:bluepad_assessment/data/models/post_comments.dart';
import 'package:flutter/material.dart';

class CommentUI extends StatelessWidget {
  final PostComment comment;

  const CommentUI({Key key, this.comment}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.person),
              Expanded(
                child: Column(
                  children: [
                    Text(comment.commenterName),
                    Text(comment.comment),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
