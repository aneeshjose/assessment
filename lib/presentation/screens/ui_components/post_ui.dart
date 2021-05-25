import 'package:bluepad_assessment/data/models/post.dart';
import 'package:flutter/material.dart';

class BlogPostUI extends StatelessWidget {
  final Post post;

  const BlogPostUI({Key key, this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(post.primaryTitle ?? ''),
        Text(post.primaryDescription ?? ''),
        Column(
          children: List.generate(
            post.subDescriptions.length,
            (index) => Column(
              children: [
                Text(post.subDescriptions[index].titleSub ?? ''),
                Text(post.subDescriptions[index].descriptionSub ?? ''),
              ],
            ),
          ).toList(),
        )
      ],
    );
  }
}
