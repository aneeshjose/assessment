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
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8),
          child: Row(
            children: [
              Expanded(child: Container(height: .5, color: Colors.black)),
              Text('You Have reached the bottom of the Screen'),
              Expanded(child: Container(height: .5, color: Colors.black)),
            ],
          ),
        ),
        // Likes and comments
        InkWell(
          onTap: () => Navigator.pushNamed(context, '/comments'),
          child: Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    text: '68',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' Like',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: '2',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' Comments ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 80)
      ],
    );
  }
}
