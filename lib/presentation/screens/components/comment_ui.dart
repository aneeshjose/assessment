import 'package:bluepad_assessment/data/models/post_comments.dart';
import 'package:flutter/material.dart';

class CommentUI extends StatelessWidget {
  final PostComment comment;

  const CommentUI({Key key, this.comment}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
      child: Column(
        children: [
          Row(
            children: [
              ClipOval(
                child: Container(
                  color: Colors.black,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
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
                  children: [Icon(Icons.favorite_outline), Text(' 10 Likes')],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [Icon(Icons.comment_outlined), Text(' Reply')],
                ),
              ),
              Text(comment.time),
            ],
          )
        ],
      ),
    );
  }
}
