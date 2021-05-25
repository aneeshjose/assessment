import 'package:bluepad_assessment/cubit/post_cubit.dart';
import 'package:bluepad_assessment/data/post_repository.dart';
import 'package:bluepad_assessment/presentation/screens/blog_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlogApp());
}

class BlogApp extends StatelessWidget {
  Repository repository;
  BlogApp() {
    repository = Repository();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => PostCubit(
          repository: repository,
        ),
        child: BlogHome(),
      ),
    );
  }
}
