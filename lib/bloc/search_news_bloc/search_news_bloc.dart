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
    on<NewsSearched>(_getSearchedNews);
  }

  @override
  Stream<Transition<SearchNewsEvent, PagingState<int, Article>>>
      transformEvents(
          Stream<SearchNewsEvent> events,
          Stream<Transition<SearchNewsEvent, PagingState<int, Article>>>
                  Function(SearchNewsEvent)
              transFn) {
    final nonDebounceStream = events.where((event) => event is! NewsSearched);
    final debounceStream = events
        .where((event) => event is NewsSearched)
        .debounceTime(const Duration(milliseconds: 500));

    return MergeStream([nonDebounceStream, debounceStream])
        .asyncExpand(transFn);
  }

  Future<void> _getSearchedNews(
      NewsSearched event, Emitter<PagingState<int, Article>> emit) async {
    if (!state.hasNextPage || state.isLoading) return;

    emit(state.copyWith(isLoading: true, error: null));
    try {
      final nextPage = (state.keys?.last ?? 0) + 1;
      query = concatString(event.query);
      final response =
          await repository.searchNewsRepo(query, nextPage.toString());

      final newsList = News.fromJson(response.data);
      newsList.articles?.removeWhere((article) {
        return article.content == null;
      });

      final newsItem = newsList.articles ?? [];
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
