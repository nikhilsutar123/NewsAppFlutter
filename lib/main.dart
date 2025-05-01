import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/headlines_bloc/headlines_bloc.dart';
import 'package:news_app/res/constant.dart';
import 'package:news_app/util/app_bloc_providers.dart';
import 'package:news_app/view/headlines_screen/headlines_homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => HeadlinesBloc())
      ],
      child: const MaterialApp(
          title: Constant.newsApp, home: HeadlinesHomescreen()),
    );
  }
}
