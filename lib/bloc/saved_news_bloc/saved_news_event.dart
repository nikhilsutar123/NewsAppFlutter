import 'package:equatable/equatable.dart';
import 'package:news_app/data/saved_news_model.dart';

abstract class SavedNewsEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadSavedNews extends SavedNewsEvent {}

class AddNewsToSaved extends SavedNewsEvent {
  final SavedNewsModel model;

  AddNewsToSaved(this.model);
}

class DeleteSavedNews extends SavedNewsEvent {
  final int index;

  DeleteSavedNews(this.index);
}
