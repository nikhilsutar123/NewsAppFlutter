import 'package:bloc/bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:news_app/bloc/search_news_bloc/search_news_event.dart';
import 'package:news_app/data/news_model.dart';
import 'package:news_app/util/app_functions.dart';
import 'package:rxdart/rxdart.dart';
import '../../repository/headlines_repository.dart';

class SearchNewsBloc extends Bloc<SearchNewsEvent, PagingState<int, Article>> {
  final HeadlinesRepository repository = HeadlinesRepository();
  String query = "";

  SearchNewsBloc() : super(PagingState<int, Article>()) {
    on<NewsSearched>(_getSearchedNews,
        transformer: (event, mapper) => event
            .debounceTime(const Duration(milliseconds: 900))
            .asyncExpand(mapper));
  }

  Future<void> _getSearchedNews(
      NewsSearched event, Emitter<PagingState<int, Article>> emit) async {
    logConsole("inside search method...");
    if (!state.hasNextPage || state.isLoading) return;

    if (event.query.trim().isEmpty) {
      emit(PagingState<int, Article>()); // reset
      return;
    }

    query = event.query;
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final nextPage = (state.keys?.last ?? 0) + 1;
      logConsole("query value ${query}");
      final response =
          await repository.searchNewsRepo(query, nextPage.toString());

      final newsList = News.fromJson(response.data);
      newsList.articles?.removeWhere((article) {
        return article.content == null;
      });

      final newsItem = newsList.articles ?? [];
      for (Article news in newsItem) {
        logConsole("${news.title}");
      }
      final isLastPage = newsItem.isEmpty;

      emit(state.copyWith(
          pages: [...?state.pages, newsItem],
          keys: [...?state.keys, nextPage],
          hasNextPage: !isLastPage,
          isLoading: false));
    } catch (e) {
      emit(state.copyWith(error: e, isLoading: false));
    }
  }

  void fetchNextPage() => add(NewsSearched(query));
}
