import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_news_app/blocs/top_news/top_bloc.dart';
import 'package:project_news_app/services/article_service.dart';
import 'package:project_news_app/views/home.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<TopBloc>(
        create: (context) => TopBloc(News()),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: BlocProvider(
          create: (context) => TopBloc(News()),
          child: Home(),
        ));
  }
}
