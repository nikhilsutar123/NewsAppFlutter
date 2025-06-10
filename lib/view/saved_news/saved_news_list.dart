import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/saved_news_bloc/saved_news_state.dart';
import 'package:news_app/res/colors.dart';
import 'package:news_app/util/api_enum.dart';
import 'package:news_app/view/saved_news/saved_news.dart';

import '../../bloc/saved_news_bloc/saved_news_bloc.dart';
import '../../res/constant.dart';
import '../../theme/app_theme.dart';

class SavedNewsList extends StatefulWidget {
  const SavedNewsList({super.key});

  @override
  State<SavedNewsList> createState() => _SavedNewsListState();
}

class _SavedNewsListState extends State<SavedNewsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Saved News",
                style: textThemeBlack(20),
              ),
            ),
            BlocBuilder<SavedNewsBloc, SavedNewsState>(
              builder: (BuildContext context, state) {
                if (state.status == ApiStatus.loading) {
                  return CircularProgressIndicator(
                    color: Appcolor.primaryColor,
                  );
                } else if (state.status == ApiStatus.failure) {
                  return Center(
                    child: Text(
                      Constant.savedNewsLoadError,
                      style: textThemeBlack(16),
                    ),
                  );
                }
                return Expanded(
                  child: ListView.builder(
                      itemCount: state.savedNews?.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: SavedNews(savedNews: state.savedNews![index]),
                        );
                      }),
                );
              },
            )
          ],
        ),
      )),
    );
  }
}
