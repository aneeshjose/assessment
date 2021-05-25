import 'package:bluepad_assessment/cubit/post_cubit.dart';
import 'package:bluepad_assessment/data/models/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlogHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PostCubit>(context).fetchPost();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: InkWell(
          onTap: () => _showSnackBar(context),
          child: Icon(
            Icons.home,
            color: Colors.black,
            size: 35,
          ),
        ),
        title: Text(
          'BluePad',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 25,
          ),
        ),
      ),
      body: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          if (!(state is PostLoaded)) return CircularProgressIndicator();
          final post = (state as PostLoaded).post;
          return ListView(
            children: [
              BlogPostUI(
                post: post,
              )
            ],
          );
        },
      ),
    );
  }

  void _showSnackBar(BuildContext context) {
    SnackBar snackBar = SnackBar(
      content: Text('Home button pressed'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

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
