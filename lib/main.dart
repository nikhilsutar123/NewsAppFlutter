import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app/bloc/bottom_navigation_bloc/bottom_navigation_bloc.dart';
import 'package:news_app/bloc/headlines_bloc/headlines_bloc.dart';
import 'package:news_app/res/constant.dart';
import 'package:news_app/util/app_bloc_providers.dart';
import 'package:news_app/view/bottom_navigation/bottom_navigation.dart';
import 'package:news_app/view/headlines_screen/headlines_homescreen.dart';
import 'package:news_app/view/saved_news/saved_news.dart';
import 'package:news_app/view/saved_news/saved_news_list.dart';

void main() async{
  runApp(const MyApp());
  await Hive.initFlutter();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => HeadlinesBloc()),
        BlocProvider(create: (_) => BottomNavigationBloc())
      ],
      child: const MaterialApp(
          title: Constant.newsApp, home: BottomNavigation()),
    );
  }
}
