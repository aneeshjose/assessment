import 'package:bluepad_assessment/cubit/comment_cubit.dart';
import 'package:bluepad_assessment/cubit/post_cubit.dart';
import 'package:bluepad_assessment/data/mock_network_service.dart';
import 'package:bluepad_assessment/data/post_repository.dart';
import 'package:bluepad_assessment/presentation/screens/blog_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screens/blog_comments.dart';

class AppRouter {
  Repository repository;
  AppRouter() {
    repository = Repository(mockNetworkService: MockNetworkService());
  }
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        {
          return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (BuildContext context) => PostCubit(
                repository: repository,
              ),
              child: BlogHome(),
            ),
          );
        }
      case "/comments":
        {
          final id = settings.arguments;
          return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (BuildContext context) => CommentCubit(
                repository: repository,
              ),
              child: BlogComments(
                id: id,
              ),
            ),
          );
        }
      default:
        return MaterialPageRoute(builder: (_) => BlogHome());
    }
  }
}
