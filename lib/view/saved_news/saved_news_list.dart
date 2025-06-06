import 'package:flutter/material.dart';
import 'package:news_app/view/saved_news/saved_news.dart';

import '../../theme/app_theme.dart';

class SavedNewsList extends StatefulWidget {
  const SavedNewsList({super.key});

  @override
  State<SavedNewsList> createState() => _SavedNewsListState();
}

class _SavedNewsListState extends State<SavedNewsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Saved News",
                style: textThemeBlack(20),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                  itemBuilder: (context,index){
                  return  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: SavedNews(index: index),
                  );
                  }),
            )
          ],
        ),
      )),
    );
  }
}
