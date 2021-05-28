import 'package:bluepad_assessment/cubit/bottom_sheet_cubit_cubit.dart';
import 'package:bluepad_assessment/cubit/post_cubit.dart';
import 'package:bluepad_assessment/presentation/screens/blog_comments.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rect_getter/rect_getter.dart';

import 'components/bottom_action_buttons.dart';
import 'components/likes_and_comments_ui.dart';
import 'components/post_ui.dart';

class BlogHome extends StatefulWidget {
  @override
  _BlogHomeState createState() => _BlogHomeState();
}

class _BlogHomeState extends State<BlogHome> {
  final ScrollController _scrollController = ScrollController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String postId;
  Map _keys = {};
  var listViewKey = RectGetter.createGlobalKey();

  @override
  void initState() {
    super.initState();
    // _scrollController.addListener(_scrollListeners);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PostCubit>(context)
        .fetchPost(postId: 'ASjdskKJnlkjkJKdsKjmsdsd');
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
      body: NotificationListener<ScrollUpdateNotification>(
        onNotification: (notification) {
          /// print all visible item's index when scroll updated.
          changeUi();
          return true;
        },
        child: BlocBuilder<PostCubit, PostState>(
          builder: (context, state) {
            if (!(state is PostLoaded))
              return Center(child: CircularProgressIndicator());
            final post = (state as PostLoaded).post;
            postId = post.id;
            List uiData = [
              SizedBox(height: 5),
              BlogPostUI(post: post),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                child: Row(
                  children: [
                    Expanded(child: Container(height: .5, color: Colors.black)),
                    Text('You Have reached the bottom of the Screen'),
                    Expanded(child: Container(height: .5, color: Colors.black)),
                  ],
                ),
              ),
              // Likes and comments
              Divider(),
              LikesAndComments(
                post: post,
              ),

              Divider(),
              BottomActionButtons(
                postId: post.id,
              ),

              Divider(),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                height: 80,
                // padding: const EdgeInsets.from(12.0),
                alignment: Alignment(0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
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
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width / 2.5,
                      padding: EdgeInsets.all(10),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              post.userName,
                              maxLines: 1,
                              overflow: TextOverflow.fade,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              post.time,
                              maxLines: 1,
                              overflow: TextOverflow.fade,
                              style: TextStyle(
                                color: Colors.grey[600],
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
              Divider(),
              Container(
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    ClipOval(
                      child: Container(
                        width: 55,
                        height: 55,
                        color: Colors.grey,
                        child: Center(
                          child: Text(
                            "D",
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 30, 10),
                        child: TextField(
                          style: TextStyle(fontSize: 20),
                          decoration: InputDecoration(
                            isCollapsed: false,
                            isDense: true,
                            contentPadding: EdgeInsets.fromLTRB(15, 14, 15, 14),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Divider(),
              BlogComments(id: post.id),
              SizedBox(
                height: 20,
              ),
            ];
            return NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (OverscrollIndicatorNotification overscroll) {
                overscroll.disallowGlow();
                return;
              },
              child: Column(
                children: [
                  Expanded(
                    child: RectGetter(
                      key: listViewKey,
                      child: ListView.builder(
                        controller: _scrollController,
                        itemCount: uiData.length,
                        itemBuilder: (context, index) {
                          _keys[index] = RectGetter.createGlobalKey();
                          return RectGetter(
                            key: _keys[index],
                            child: uiData[index],
                          );
                        },
                      ),
                    ),
                  ),
                  BlocBuilder<BottomSheetCubitCubit, BottomSheetCubitState>(
                    builder: (context, state) {
                      if (state is RemoveBottomSheet) {
                        return Container();
                      }
                      return Container(
                          padding: EdgeInsets.all(10),
                          child: BottomActionButtons(postId: post.id));
                    },
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void changeUi() {
    /// First, get the rect of ListView, and then traverse the _keys
    /// get rect of each item by keys in _keys, and if this rect in the range of ListView's rect,
    /// set the index as item
    var rect = RectGetter.getRectFromKey(listViewKey);
    var _item = 0;
    _keys.forEach((index, key) {
      var itemRect = RectGetter.getRectFromKey(key);
      if (itemRect != null &&
          !(itemRect.top > rect.bottom || itemRect.bottom < rect.top))
        _item = (index);
    });
    // remove the bottom button set if the bottombuttons inside the page on the screen
    if (_item >= 6) {
      BlocProvider.of<BottomSheetCubitCubit>(context).removeBottomButtons();
    }
    // Add the bottom button set if the bottombuttons inside the page out of the page
    else if (_item <= 5 &&
        _scrollController.position.userScrollDirection ==
            ScrollDirection.reverse) {
      BlocProvider.of<BottomSheetCubitCubit>(context).addBottomButtons();
    } else if (_item <= 5) {
      BlocProvider.of<BottomSheetCubitCubit>(context).addBottomButtons();
    }
  }

  void _showSnackBar(BuildContext context) {
    SnackBar snackBar = SnackBar(
      content: Text('Home button pressed'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
