import 'package:equatable/equatable.dart';
import 'package:news_app/data/saved_news_model.dart';
import 'package:news_app/util/api_enum.dart';

class SavedNewsState extends Equatable {
  final ApiStatus? status;
  final List<SavedNewsModel>? savedNews;
  final String? errorMsg;

  const SavedNewsState(
      {this.status = ApiStatus.loading,
      this.savedNews = const <SavedNewsModel>[],
      this.errorMsg});

  SavedNewsState copyWith(
      {ApiStatus? status, List<SavedNewsModel>? savedNews, String? errorMsg}) {
    return SavedNewsState(
        status: status ?? this.status,
        savedNews: savedNews ?? this.savedNews,
        errorMsg: errorMsg ?? this.errorMsg);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status,savedNews,errorMsg];
}
