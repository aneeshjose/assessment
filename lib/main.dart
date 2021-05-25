import 'package:bluepad_assessment/presentation/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BlogApp(
    router: AppRouter(),
  ));
}

class BlogApp extends StatelessWidget {
  final AppRouter router;

  const BlogApp({Key key, this.router}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: router.generateRoute,
    );
  }
}
