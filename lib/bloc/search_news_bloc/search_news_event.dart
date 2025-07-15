import 'package:equatable/equatable.dart';

abstract class SearchNewsEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class NewsSearched extends SearchNewsEvent {
  final String query;

  NewsSearched(this.query);
}