import 'package:bloc/bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:news_app/data/news_model.dart';
import 'package:news_app/repository/headlines_repository.dart';

import 'headlines_event.dart';

class HeadlinesBloc extends Bloc<HeadlinesEvent, PagingState<int, Article>> {
  final HeadlinesRepository repository = HeadlinesRepository();

  HeadlinesBloc() : super(PagingState<int, Article>()) {
    on<HeadlinesFetched>(_getHeadlines);
  }

  Future<void> _getHeadlines(
      HeadlinesFetched event, Emitter<PagingState<int, Article>> emit) async {
    if (!state.hasNextPage || state.isLoading) return;

    emit(state.copyWith(isLoading: true, error: null));
    try {
      final nextPage = (state.keys?.last ?? 0) + 1;
      final response = await repository.headlinesRepo(nextPage.toString());

      final newsList = News.fromJson(response.data);
      newsList.articles?.removeWhere((article) => article.content == null);

      final newsItems = newsList.articles ?? [];
      final isLastPage = newsItems.isEmpty;

      emit(state.copyWith(
          pages: [...?state.pages, newsItems],
          keys: [...?state.keys, nextPage],
          hasNextPage: !isLastPage,
          isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e));
    }
  }

  void fetchNextPage() => add(HeadlinesFetched());

  Future<void> _getSearchedNews(
      NewsSearched event, Emitter<PagingState<int, Article>> emit) async {
    if(!state.hasNextPage || state.isLoading) return;
    emit(state.copyWith(isLoading: true,error: null));
    try{
      final nextPage = (state.keys?.last ?? 0) + 1;
    }catch(e){}
  }
}
