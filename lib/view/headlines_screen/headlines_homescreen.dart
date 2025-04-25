import 'package:flutter/material.dart';
import 'package:news_app/theme/app_theme.dart';

class HeadlinesHomescreen extends StatefulWidget {
  const HeadlinesHomescreen({super.key});

  @override
  State<HeadlinesHomescreen> createState() => _HeadlinesHomescreenState();
}

class _HeadlinesHomescreenState extends State<HeadlinesHomescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Top Headlines",
                          style: textThemeBlack(20),
                        ),
                        Text(
                          "Show more",
                          style: textThemeBlack(20),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}
