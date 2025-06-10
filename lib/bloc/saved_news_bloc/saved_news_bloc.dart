import 'package:bloc/bloc.dart';
import 'package:news_app/bloc/saved_news_bloc/saved_news_event.dart';
import 'package:news_app/bloc/saved_news_bloc/saved_news_state.dart';
import 'package:news_app/service/hive_service.dart';
import 'package:news_app/util/api_enum.dart';

class SavedNewsBloc extends Bloc<SavedNewsEvent, SavedNewsState> {
   HiveService hiveService = HiveService();

  SavedNewsBloc() : super(const SavedNewsState()) {
    on<LoadSavedNews>(_onLoadNews);
    on<AddNewsToSaved>(_onAddNews);
    on<DeleteSavedNews>(_onDeleteNews);
  }

  Future<void> _onLoadNews(
      LoadSavedNews event, Emitter<SavedNewsState> emit) async {
    emit(state.copyWith(status: ApiStatus.loading));
    try {
      final saved = await hiveService.read();
      emit(state.copyWith(status: ApiStatus.success, savedNews: saved));
    } catch (e) {
      emit(state.copyWith(status: ApiStatus.failure, errorMsg: e.toString()));
    }
  }

  Future<void> _onAddNews(
      AddNewsToSaved event, Emitter<SavedNewsState> emit) async {
    try {
      await hiveService.insert(event.model);
      final latestNewsList = await hiveService.read();
      emit(
          state.copyWith(status: ApiStatus.success, savedNews: latestNewsList));
    } catch (e) {
      emit(state.copyWith(status: ApiStatus.failure, errorMsg: e.toString()));
    }
  }

  Future<void> _onDeleteNews(
      DeleteSavedNews event, Emitter<SavedNewsState> emit) async {
    try {
      await hiveService.delete(event.index);
      final latestNewsList = await hiveService.read();
      emit(
          state.copyWith(status: ApiStatus.success, savedNews: latestNewsList));
    } catch (e) {
      emit(state.copyWith(status: ApiStatus.failure, errorMsg: e.toString()));
    }
  }
}
