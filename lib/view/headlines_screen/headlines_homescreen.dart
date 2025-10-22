import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:news_app/bloc/headlines_bloc/headlines_event.dart';
import 'package:news_app/bloc/saved_news_bloc/saved_news_bloc.dart';
import 'package:news_app/bloc/saved_news_bloc/saved_news_event.dart';
import 'package:news_app/data/news_model.dart';
import 'package:news_app/theme/app_theme.dart';
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
    context.read<SavedNewsBloc>().add(LoadSavedNews());
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
                        ElevatedButton(onPressed: (){
                          throw Exception('Test Crash!');
                        }, child: const Text('Crash app'))
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
                                  return TweenAnimationBuilder<double>(
                                    tween: Tween(begin: 0.8, end: 1),
                                    duration:
                                        Duration(milliseconds: 200 * index),
                                    curve: Curves.easeOutCirc,
                                    builder: (context, value, child) {
                                      return Opacity(
                                          opacity: value.clamp(0.0, 1.0),
                                          child: Transform.scale(
                                            scale: value,
                                            child: child,
                                          ));
                                    },
                                    child: HeadlineNewsSingleItem(
                                        article: article),
                                  );
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
