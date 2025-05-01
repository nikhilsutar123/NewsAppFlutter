import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/headlines_bloc/headlines_event.dart';
import 'package:news_app/bloc/headlines_bloc/headlines_state.dart';
import 'package:news_app/data/news_model.dart';
import 'package:news_app/theme/app_theme.dart';
import 'package:news_app/util/api_enum.dart';
import 'package:news_app/view/headlines_screen/headline_news_single_item.dart';

import '../../bloc/headlines_bloc/headlines_bloc.dart';

class HeadlinesHomescreen extends StatefulWidget {
  const HeadlinesHomescreen({super.key});

  @override
  State<HeadlinesHomescreen> createState() => _HeadlinesHomescreenState();
}

class _HeadlinesHomescreenState extends State<HeadlinesHomescreen> {
  @override
  void initState() {
    super.initState();
    context.read<HeadlinesBloc>().add(HeadlinesFetched());
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
                      // Text(
                      //   "Show more",
                      //   style: textThemeBlack(20),
                      //
                      // ),
                    ],
                  ),
                ),
                BlocBuilder<HeadlinesBloc, HeadlinesStates>(
                  builder: (context, state) {
                    switch (state.status) {
                      case ApiStatus.loading:
                        return Align(
                            alignment: Alignment.center,
                            child: const CircularProgressIndicator());
                      case ApiStatus.success:
                        return Expanded(
                          child: ListView.builder(
                              itemCount: state.news.articles!.length,
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: HeadlineNewsSingleItem(
                                      article: state.news.articles![index]),
                                );
                              }),
                        );
                      case ApiStatus.failure:
                        return Center(
                            child: Text(
                          state.news.status.toString(),
                          style: textThemeBlack(14),
                        ));
                    }
                  },
                ),
              ],
            ),
          )),
    ));
  }
}
