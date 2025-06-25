import 'package:mocktail/mocktail.dart';
import 'package:news_app/bloc/saved_news_bloc/saved_news_bloc.dart';
import 'package:news_app/bloc/saved_news_bloc/saved_news_event.dart';
import 'package:news_app/bloc/saved_news_bloc/saved_news_state.dart';

class MockSavedNewsBloc extends Mock implements SavedNewsBloc{}

class FakeSavedNewsEvent extends Fake implements SavedNewsEvent{}
class FakeSavedNewsState extends Fake implements SavedNewsState{}