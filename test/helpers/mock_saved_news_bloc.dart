import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_app/bloc/saved_news_bloc/saved_news_bloc.dart';
import 'package:news_app/bloc/saved_news_bloc/saved_news_event.dart';
import 'package:news_app/bloc/saved_news_bloc/saved_news_state.dart';
import 'package:news_app/util/api_enum.dart';

class MockSavedNewsBloc extends MockBloc<SavedNewsEvent,SavedNewsState> implements SavedNewsBloc {
}

class FakeSavedNewsEvent extends Fake implements SavedNewsEvent {}

class FakeSavedNewsState extends Fake implements SavedNewsState {}
