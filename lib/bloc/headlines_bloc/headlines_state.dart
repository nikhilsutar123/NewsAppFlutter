import 'package:equatable/equatable.dart';
import 'package:news_app/util/api_enum.dart';

import '../../data/news_model.dart';

class HeadlinesStates extends Equatable {
  final ApiStatus status;
  final News news;

  const HeadlinesStates({
    this.status = ApiStatus.loading,
    this.news = const News(articles: []),
  });

  HeadlinesStates copyWith({ApiStatus? status, News? news}) {
    return HeadlinesStates(
      status: status ?? this.status,
      news: news ?? this.news,
    );
  }

  @override
  List<Object?> get props => [status, news];
}
