import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:news_app/data/news_model.dart';
import 'package:news_app/repository/headlines_repository.dart';
import 'package:news_app/util/api_enum.dart';
import 'package:news_app/util/app_functions.dart';

import 'headlines_event.dart';
import 'headlines_state.dart';

class HeadlinesBloc extends Bloc<HeadlinesEvent, HeadlinesStates> {
  final HeadlinesRepository repository = HeadlinesRepository();

  HeadlinesBloc() : super(const HeadlinesStates()) {
    on<HeadlinesFetched>(_getHeadlines);
  }

  void _getHeadlines(
      HeadlinesFetched event, Emitter<HeadlinesStates> emit) async {
    emit(state.copyWith(status: ApiStatus.loading));
    try {
      final response = await repository.headlinesRepo();
      final newsList = News.fromJson(response.data);
      newsList.articles!.removeWhere((news) {
        return news.content == null;
      });
      logConsole("news data ${newsList.status} ${newsList.articles!.length}");
      emit(state.copyWith(status: ApiStatus.success, news: newsList));
    } catch (e) {
      emit(state.copyWith(status: ApiStatus.failure));
      logConsole("went wrong ${e.toString()}");
      rethrow;
    }
  }
}
