import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app/bloc/bottom_navigation_bloc/bottom_navigation_bloc.dart';
import 'package:news_app/bloc/headlines_bloc/headlines_bloc.dart';
import 'package:news_app/bloc/saved_news_bloc/saved_news_bloc.dart';
import 'package:news_app/bloc/saved_news_bloc/saved_news_event.dart';
import 'package:news_app/bloc/search_news_bloc/search_news_bloc.dart';
import 'package:news_app/bloc/snack_bar_bloc/snackbar_bloc.dart';
import 'package:news_app/res/constant.dart';
import 'package:news_app/view/bottom_navigation/bottom_navigation.dart';

import 'data/saved_news_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(SavedNewsModelAdapter());

  final savedNewsBloc = SavedNewsBloc();
  savedNewsBloc.add(LoadSavedNews());
  runApp(MyApp(
    savedNewsBloc: savedNewsBloc,
  ));
}

class MyApp extends StatelessWidget {
  final SavedNewsBloc savedNewsBloc;

  const MyApp({required this.savedNewsBloc, super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SavedNewsBloc>.value(value: savedNewsBloc),
        BlocProvider(create: (_) => HeadlinesBloc()),
        BlocProvider(create: (_) => BottomNavigationBloc()),
        BlocProvider(create: (_) => SavedNewsBloc()),
        BlocProvider(create: (_) => SnackbarBloc()),
        BlocProvider(create: (_) => SearchNewsBloc()),
      ],
      child:
          const MaterialApp(title: Constant.newsApp, home: BottomNavigation()),
    );
  }
}
