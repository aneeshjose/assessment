import 'package:bluepad_assessment/cubit/post_cubit.dart';
import 'package:bluepad_assessment/data/models/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ui_components/post_ui.dart';

class BlogHome extends StatefulWidget {
  @override
  _BlogHomeState createState() => _BlogHomeState();
}

class _BlogHomeState extends State<BlogHome> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListeners);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

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
            controller: _scrollController,
            children: [
              BlogPostUI(
                post: post,
              )
            ]..add(Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.blue[200],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('You Have reached the bottom of the Screen'),
                  ),
                ),
              )),
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

  void _scrollListeners() {
    if (_scrollController
        .position.atEdge) if (_scrollController.position.pixels != 0.0) {
      print('Bottom');
    }
  }
}
