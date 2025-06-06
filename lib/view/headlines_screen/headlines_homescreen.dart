import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:news_app/bloc/headlines_bloc/headlines_event.dart';
import 'package:news_app/bloc/headlines_bloc/headlines_state.dart';
import 'package:news_app/data/news_model.dart';
import 'package:news_app/theme/app_theme.dart';
import 'package:news_app/util/api_enum.dart';
import 'package:news_app/util/app_exceptions.dart';
import 'package:news_app/util/app_functions.dart';
import 'package:news_app/view/headlines_screen/headline_news_single_item.dart';

import '../../bloc/headlines_bloc/headlines_bloc.dart';

class HeadlinesHomescreen extends StatefulWidget {
  const HeadlinesHomescreen({super.key});

  @override
  State<HeadlinesHomescreen> createState() => _HeadlinesHomescreenState();
}

class _HeadlinesHomescreenState extends State<HeadlinesHomescreen> {
  late final HeadlinesBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = HeadlinesBloc();
    _bloc.add(HeadlinesFetched());
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Top Headlines",
                          style: textThemeBlack(20),
                        ),
                      ],
                    ),
                  ),
                  BlocBuilder<HeadlinesBloc, PagingState<int, Article>>(
                    bloc: _bloc,
                    builder: (context, state) {
                      return Expanded(
                        child: PagedListView<int, Article>(
                            state: state,
                            fetchNextPage: _bloc.fetchNextPage,
                            builderDelegate: PagedChildBuilderDelegate<Article>(
                                animateTransitions: true,
                                itemBuilder: (context, article, index) {
                                  logConsole("articles $article");
                                  return HeadlineNewsSingleItem(article: article);
                                })),
                      );
                    },
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
