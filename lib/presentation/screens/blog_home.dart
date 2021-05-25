import 'package:bluepad_assessment/cubit/post_cubit.dart';
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
      body: Center(
        child: Text(''),
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
