import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:news_app/data/news_model.dart';
import 'package:news_app/repository/headlines_repository.dart';
import 'package:news_app/util/api_enum.dart';
import 'package:news_app/util/app_functions.dart';

import 'headlines_event.dart';
import 'headlines_state.dart';

class HeadlinesBloc extends Bloc<HeadlinesEvent, PagingState<int, Article>> {
  final HeadlinesRepository repository = HeadlinesRepository();

  HeadlinesBloc() : super(PagingState()) {
    on<HeadlinesFetched>(_getHeadlines);
  }

  Future<void> _getHeadlines(
      HeadlinesFetched event, Emitter<PagingState<int, Article>> emit) async {
    if(!state.hasNextPage || state.isLoading) return;

    emit(state.copyWith(isLoading: true));

    // try{
    //   final pageNum = int.tryParse(event.pageNum) ?? 1;
    //   final response = await repository.headlinesRepo(event.pageNum);
    //   final newsList = News.fromJson(response.data);
    //   newsList.articles!.removeWhere((news) {
    //   return news.content == null;
    // });
    //   final newItems = newsList.articles ?? [];
    //   final isLastPage = newItems.length < 20;
    // }
  }
// void _getHeadlines(
//     HeadlinesFetched event, Emitter<HeadlinesStates> emit) async {
//   try {
//     bool isFirstPage = event.pageNum.contains(1.toString());
//     if (isFirstPage) {
//       emit(state.copyWith(status: ApiStatus.loading));
//     }
//     final response = await repository.headlinesRepo(event.pageNum);
//     final newsList = News.fromJson(response.data);
//     newsList.articles!.removeWhere((news) {
//       return news.content == null;
//     });
//     final List<Article> currArticles =
//         isFirstPage ? [] : (state.news.articles ?? []);
//
//     final List<Article> updatedArticles = [
//       ...currArticles,
//       ...(newsList.articles ?? [])
//     ];
//
//     final mergedNews = newsList.copyWith(articles: updatedArticles);
//     logConsole("mergedNews data ${mergedNews.status} ${mergedNews.articles!.length}");
//     emit(state.copyWith(status: ApiStatus.success, news: mergedNews));
//   } catch (e) {
//     emit(state.copyWith(status: ApiStatus.failure));
//     logConsole("went wrong ${e.toString()}");
//     rethrow;
//   }
// }
}
