import 'package:bluepad_assessment/data/models/post_comments.dart';
import 'package:flutter/material.dart';

class CommentUI extends StatelessWidget {
  final PostComment comment;

  const CommentUI({Key key, this.comment}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final String likes = comment.likes.toString();
    final String replies = comment.replies.toString();
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Column(
        children: [
          Row(
            children: [
              ClipOval(
                child: Container(
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        comment.commenterName,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        comment.comment,
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              SizedBox(width: MediaQuery.of(context).size.width / 4),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.favorite_outline),
                    Text(comment.likes.toString()),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.comment_outlined),
                    Text(comment.replies.toString()),
                  ],
                ),
              ),
              Text(comment.time),
            ],
          ),
          if (comment.replies > 0)
            Container(
              alignment: Alignment(-.7, 1),
              width: MediaQuery.of(context).size.width,
              child: Text(
                'view $replies repl${comment.replies > 1 ? 'ies' : 'y'}',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          Divider(),
        ],
      ),
    );
  }
}
