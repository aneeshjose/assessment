import 'package:bluepad_assessment/data/models/post.dart';
import 'package:flutter/material.dart';

class BlogPostUI extends StatelessWidget {
  final Post post;

  const BlogPostUI({Key key, this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          post.primaryTitle ?? '',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        Text(post.primaryDescription ?? ''),
        Column(
          children: List.generate(
            post.subDescriptions.length,
            (index) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: post.subDescriptions[index].titleSub == null
                      ? const EdgeInsets.all(0)
                      : const EdgeInsets.only(top: 5, bottom: 5),
                  child: Text(
                    post.subDescriptions[index].titleSub ?? '',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(post.subDescriptions[index].descriptionSub ?? ''),
              ],
            ),
          ).toList(),
        ),
        // SizedBox(height: 70)
      ],
    );
  }
}
