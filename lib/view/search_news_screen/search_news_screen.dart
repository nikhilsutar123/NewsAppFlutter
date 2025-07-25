import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/bloc/saved_news_bloc/saved_news_event.dart';
import 'package:news_app/bloc/search_news_bloc/search_news_bloc.dart';
import 'package:news_app/bloc/search_news_bloc/search_news_event.dart';
import 'package:news_app/res/colors.dart';
import 'package:news_app/shared_widgets/custom_outlined_button.dart';
import 'package:news_app/theme/app_theme.dart';
import 'package:news_app/util/app_functions.dart';
import 'package:news_app/view/headlines_screen/headline_news_single_item.dart';

import '../../bloc/saved_news_bloc/saved_news_bloc.dart';
import '../../data/news_model.dart';
import '../../res/constant.dart';

class SearchNewsScreen extends StatefulWidget {
  const SearchNewsScreen({super.key});

  @override
  State<SearchNewsScreen> createState() => _SearchNewsScreenState();
}

class _SearchNewsScreenState extends State<SearchNewsScreen> {
  late final SearchNewsBloc _bloc;
  final TextEditingController _controller = TextEditingController();
  String? query;

  @override
  void initState() {
    super.initState();
    _bloc = SearchNewsBloc();
    context.read<SavedNewsBloc>().add(LoadSavedNews());
  }

  @override
  void dispose() {
    _controller.dispose();
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
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
                  controller: _controller,
                  decoration: InputDecoration(
                    hint: const Text("See what's happening today..."),
                    hintStyle: textThemeGrey(12),
                    prefixIcon: const Icon(Icons.search),
                    contentPadding: const EdgeInsets.all(2),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Appcolor.primaryColor),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  onChanged: (value) {
                    query = concatString(value);
                    context.read<SearchNewsBloc>().add(NewsSearched(query.toString()));
                  },
                ),
              ),
              BlocBuilder<SearchNewsBloc, PagingState<int, Article>>(
                  bloc: _bloc,
                  builder: (context, state) {
                    final isQueryEmpty = _bloc.query.trim().isEmpty;
                    if (isQueryEmpty) {
                      return Column(
                        children: [
                          Lottie.asset(
                            Constant.searchNewsPlaceholder,
                            height: deviceSize.height / 4,
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            "Looking for some juicy headlines? \nStart typing!",
                            style: textThemeGrey(18),
                          )
                        ],
                      );
                    }
                    return Expanded(
                        child: PagedListView(
                            state: state,
                            fetchNextPage: _bloc.fetchNextPage,
                            builderDelegate: PagedChildBuilderDelegate<Article>(
                                animateTransitions: true,
                                itemBuilder: (context, article, index) {
                                  return HeadlineNewsSingleItem(
                                    article: article,
                                  );
                                },
                                firstPageProgressIndicatorBuilder: (_) =>
                                    const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                noItemsFoundIndicatorBuilder: (_) => Center(
                                      child: Text(
                                        "No News found for ${_bloc.query}.",
                                        style: textThemeGrey(16),
                                      ),
                                    ),
                                firstPageErrorIndicatorBuilder: (_) => Center(
                                      child: Column(
                                        children: [
                                          Text(
                                            "Failed to load news. Please try again.",
                                            style: textThemeGrey(16),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8.0),
                                            child: CustomOutlinedButton(
                                                text: "Retry",
                                                onPressed: () {
                                                  _bloc.fetchNextPage();
                                                },
                                                borderColor:
                                                    Appcolor.secondaryColor,
                                                textStyle:
                                                    textThemePrimary(14)),
                                          )
                                        ],
                                      ),
                                    ))));
                  })
            ],
          ),
        )),
      ),
    );
  }
}
