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
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              ClipOval(
                clipBehavior: Clip.hardEdge,
                child: Container(
                  color: Colors.black,
                  height: 50,
                  width: 50,
                  child: Center(
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
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.userName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        post.time,
                        style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    'Follow',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        // Likes and comments
        InkWell(
          onTap: () =>
              Navigator.pushNamed(context, '/comments', arguments: post.id),
          child: Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    text: post.likeCount?.toString() ?? '0',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' Like' + (post.likeCount > 1 ? 's' : ''),
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
                    text: post.commentCount?.toString() ?? '0',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' Comment' + (post.commentCount > 1 ? 's' : ''),
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

        SizedBox(height: 70)
      ],
    );
  }
}
