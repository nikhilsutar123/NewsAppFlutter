import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_app/bloc/saved_news_bloc/saved_news_bloc.dart';
import 'package:news_app/bloc/saved_news_bloc/saved_news_event.dart';
import 'package:news_app/bloc/saved_news_bloc/saved_news_state.dart';
import 'package:news_app/data/saved_news_model.dart';
import 'package:news_app/service/hive_service.dart';
import 'package:news_app/util/api_enum.dart';

class MockDeleteNewsHiveService extends Mock implements HiveService {}

void main() {
  late MockDeleteNewsHiveService deleteNewsHiveService;
  late SavedNewsBloc savedNewsBloc;

  final updatedList = <SavedNewsModel>[];

  setUp(() {
    deleteNewsHiveService = MockDeleteNewsHiveService();
    savedNewsBloc = SavedNewsBloc(hiveService: deleteNewsHiveService);
  });

  group("SavedNewsBloc - _onDeleteNews", () {
    blocTest<SavedNewsBloc, SavedNewsState>(
        "emits success when hiveService.delete and read succeed",
        build: () {
          when(() => deleteNewsHiveService.insert(any())).thenAnswer((_) async {});
          when(() => deleteNewsHiveService.delete(0)).thenAnswer((_) async {});
          when(() => deleteNewsHiveService.read())
              .thenAnswer((_) async => updatedList);
          return savedNewsBloc;
        },
        act: (bloc) => bloc.add(DeleteSavedNews(0)),
        expect: () => [
          isA<SavedNewsState>()
            ],
        verify: (_) {
          verify(() => deleteNewsHiveService.delete(0)).called(1);
          verify(() => deleteNewsHiveService.read()).called(1);
        }
        );
    blocTest<SavedNewsBloc, SavedNewsState>(
        "emits failure when hiveService.delete throws exception",
        build: () {
          when(() => deleteNewsHiveService.delete(0))
              .thenThrow(Exception("delete failed"));
          return savedNewsBloc;
        },
        act: (bloc) => bloc.add(DeleteSavedNews(0)),
        expect: () => [
              predicate<SavedNewsState>(
                  (state) => state.status == ApiStatus.failure),
            ],
        verify: (_) {
          verify(() => deleteNewsHiveService.delete(0)).called(1);
        });
  });
}
