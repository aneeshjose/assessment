import 'package:bluepad_assessment/cubit/like_comment_count_cubit.dart';
import 'package:bluepad_assessment/data/models/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LikesAndComments extends StatelessWidget {
  final Post post;

  const LikesAndComments({
    Key key,
    this.post,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<LikeCommentCountCubit>(context).fetchLikeComments(post.id);

    return InkWell(
        onTap: () =>
            Navigator.pushNamed(context, '/comments', arguments: post.id),
        child: Padding(
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          child: BlocBuilder<LikeCommentCountCubit, LikeCommentCountState>(
              builder: (context, state) {
            if (!(state is LikeCommentCountLoaded)) {
              return Container(
                height: 60,
              );
            } else {
              final stat = (state as LikeCommentCountLoaded).stat;
              return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: stat.likes?.toString() ?? '0',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' Like' + (stat.likes > 1 ? 's' : ''),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ]),
                    ),
                    RichText(
                      text: TextSpan(
                        text: stat.comments?.toString() ?? '0',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' Comment' + (stat.comments > 1 ? 's' : ''),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          )
                        ],
                      ),
                    )
                  ]);
            }
          }),
        ));
  }
}
