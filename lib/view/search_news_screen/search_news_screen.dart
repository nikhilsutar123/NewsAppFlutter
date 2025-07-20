import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/saved_news_bloc/saved_news_event.dart';
import 'package:news_app/bloc/search_news_bloc/search_news_bloc.dart';
import 'package:news_app/res/colors.dart';
import 'package:news_app/theme/app_theme.dart';

import '../../bloc/saved_news_bloc/saved_news_bloc.dart';

class SearchNewsScreen extends StatefulWidget {
  const SearchNewsScreen({super.key});

  @override
  State<SearchNewsScreen> createState() => _SearchNewsScreenState();
}

class _SearchNewsScreenState extends State<SearchNewsScreen> {
  late final SearchNewsBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = SearchNewsBloc();
    context.read<SavedNewsBloc>().add(LoadSavedNews());
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
            child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: TextFormField(
                  decoration: InputDecoration(
                      hint: const Text("See what's happening today..."),
                      hintStyle: textThemeGrey(12),
                      prefixIcon: const Icon(Icons.search),
                      contentPadding: const EdgeInsets.all(8),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Appcolor.primaryColor),
                          borderRadius: BorderRadius.circular(10))),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
