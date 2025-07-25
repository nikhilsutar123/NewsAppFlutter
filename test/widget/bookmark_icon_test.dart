import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_app/bloc/bottom_navigation_bloc/bottom_navigation_bloc.dart';
import 'package:news_app/bloc/headlines_bloc/headlines_bloc.dart';
import 'package:news_app/bloc/saved_news_bloc/saved_news_bloc.dart';
import 'package:news_app/bloc/saved_news_bloc/saved_news_event.dart';
import 'package:news_app/bloc/saved_news_bloc/saved_news_state.dart';
import 'package:news_app/bloc/snack_bar_bloc/snackbar_bloc.dart';
import 'package:news_app/data/news_model.dart';
import 'package:news_app/data/saved_news_model.dart';
import 'package:news_app/util/api_enum.dart';
import 'package:news_app/view/headlines_screen/headline_news_single_item.dart';

import '../helpers/mock_saved_news_bloc.dart';

void main() {
  setUpAll(() {
    registerFallbackValue(FakeSavedNewsEvent());
    registerFallbackValue(FakeSavedNewsState());
  });

  late MockSavedNewsBloc mockSavedNewsBloc;

  final testArticle = SavedNewsModel(
      title: "Test news",
      url:
          "https://www.indiatvnews.com/auto/elon-musk-s-robotaxi-project-under-fire-after-wrong-way-driving-video-surfaces-2025-06-25-996119",
      imageUrl:
          "",
      author: "om gupta",
      publishedAt: "2025-06-25T05:31:40Z");

  setUp(() {
    mockSavedNewsBloc = MockSavedNewsBloc();
    when(() => mockSavedNewsBloc.state).thenReturn(
        const SavedNewsState(savedNews: [], status: ApiStatus.success));

    whenListen(
        mockSavedNewsBloc,
        Stream.fromIterable(
            [const SavedNewsState(savedNews: [], status: ApiStatus.success)]));
  });

  testWidgets("Tapping bookmark event dispatches addNewsToSaved event",
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: MultiBlocProvider(providers: [
        BlocProvider(create: (_) => HeadlinesBloc()),
        BlocProvider(create: (_) => BottomNavigationBloc()),
        BlocProvider<SavedNewsBloc>.value(value: mockSavedNewsBloc),
        BlocProvider(create: (_) => SnackbarBloc()),
      ], child: Scaffold(
        body: HeadlineNewsSingleItem(
          article: Article(
            author: testArticle.author,
            url: testArticle.url,
            urlToImage: '', // empty to avoid network call
            title: testArticle.title,
            publishedAt: DateTime.parse(testArticle.publishedAt.toString()),
          ),
        ),
      ))
    ));

    await tester.pumpAndSettle();
    final bookmarkIcon = find.byIcon(Icons.bookmark);
    expect(bookmarkIcon, findsOneWidget);

    await tester.tap(bookmarkIcon);
    await tester.pumpAndSettle();

    verify(() => mockSavedNewsBloc.add(AddNewsToSaved(testArticle))).called(1);
  });
}
