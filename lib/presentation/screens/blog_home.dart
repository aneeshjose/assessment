import 'package:bluepad_assessment/cubit/post_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/bottom_action_buttons.dart';
import 'components/post_ui.dart';

class BlogHome extends StatefulWidget {
  @override
  _BlogHomeState createState() => _BlogHomeState();
}

class _BlogHomeState extends State<BlogHome> {
  final ScrollController _scrollController = ScrollController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String postId;

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
      key: _scaffoldKey,
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
          if (!(state is PostLoaded))
            return Center(child: CircularProgressIndicator());
          final post = (state as PostLoaded).post;
          postId = post.id;
          return NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (OverscrollIndicatorNotification overscroll) {
              overscroll.disallowGlow();
              return;
            },
            child: ListView(
              controller: _scrollController,
              children: [
                SizedBox(height: 5),
                BlogPostUI(
                  post: post,
                ),
              ],
            ),
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

  PersistentBottomSheetController _bottomSheetController;

  Future<void> _scrollListeners() async {
    if (_scrollController.position.atEdge) {
      if (_scrollController.position.pixels != 0.0) {
        _bottomSheetController = _scaffoldKey.currentState.showBottomSheet(
          (context) => BottomSheet(
            onClosing: () => false,
            builder: (context) {
              return BottomActionButtons();
            },
          ),
        );
      }
    } else {
      try {
        _bottomSheetController.close();
      } catch (e) {
        print(e);
      }
    }
  }
}
