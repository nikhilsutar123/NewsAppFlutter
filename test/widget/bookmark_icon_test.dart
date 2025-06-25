import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_app/bloc/saved_news_bloc/saved_news_bloc.dart';
import 'package:news_app/bloc/saved_news_bloc/saved_news_event.dart';
import 'package:news_app/bloc/saved_news_bloc/saved_news_state.dart';
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
      url: "https://www.indiatvnews.com/auto/elon-musk-s-robotaxi-project-under-fire-after-wrong-way-driving-video-surfaces-2025-06-25-996119",
      imageUrl: "https://resize.indiatvnews.com/en/resize/newbucket/1200_-/2025/06/musk-s-robotaxi-project-under-fire-1750818402.webp",
      author: "om gupta",
      publishedAt: "June 25, 2025"
  );

  setUp(() {
    mockSavedNewsBloc = MockSavedNewsBloc();
  });

  testWidgets("Tapping bookmark event dispatches addNewsToSaved event", (
      WidgetTester tester) async {
    when(() => mockSavedNewsBloc.state).thenReturn(
        const SavedNewsState(savedNews: [], status: ApiStatus.success)
    );
    await tester.pumpWidget(MaterialApp(
      home: BlocProvider<SavedNewsBloc>.value(
        value: mockSavedNewsBloc,
        child: HeadlineNewsSingleItem(
          article: Article(author: testArticle.author,
              url: testArticle.url,
              urlToImage: testArticle.imageUrl,
              title: testArticle.title,
              publishedAt: DateTime.parse(
                  testArticle.publishedAt.toString())),),
      ),
    ));

    final bookmarkIcon = find.byIcon(Icons.bookmark);
    expect(bookmarkIcon, findsOneWidget);

    await tester.tap(bookmarkIcon);
    await tester.pumpAndSettle();

    verify(() => mockSavedNewsBloc.add(AddNewsToSaved(testArticle))).called(1);
  }
  );
}