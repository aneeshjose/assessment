import 'package:bluepad_assessment/cubit/like_comment_count_cubit.dart';
import 'package:bluepad_assessment/data/mock_network_service.dart';
import 'package:bluepad_assessment/data/models/post.dart';
import 'package:bluepad_assessment/data/post_repository.dart';
import 'package:bluepad_assessment/presentation/screens/components/likes_and_comments_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        BlocProvider(
          create: (context) => LikeCommentCountCubit(
              repository: Repository(mockNetworkService: MockNetworkService())),
          child: LikesAndComments(
            post: post,
          ),
        ),
        SizedBox(height: 70)
      ],
    );
  }
}
