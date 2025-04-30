import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/data/news_model.dart';
import 'package:news_app/theme/app_theme.dart';
import 'package:news_app/view/headlines_screen/headline_news_single_item.dart';

class HeadlinesHomescreen extends StatefulWidget {
  const HeadlinesHomescreen({super.key});

  @override
  State<HeadlinesHomescreen> createState() => _HeadlinesHomescreenState();
}

@override
void initState() {}

class _HeadlinesHomescreenState extends State<HeadlinesHomescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Padding(
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
                          // Text(
                          //   "Show more",
                          //   style: textThemeBlack(20),
                          //
                          // ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: 6,
                          padding: EdgeInsets.symmetric(vertical: 8),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: HeadlineNewsSingleItem(
                                article: Article(
                                    source: Source(name: "CNBC"),
                                    author: "Nikhil Sutar",
                                    title:
                                    "Asia-Pacific markets trade mixed as Trump softens tariff stance - CNBC",
                                    description: "description",
                                    url:
                                    "Asia-Pacific markets trade mixed as Trump softens tariff stance - CNBC",
                                    urlToImage:
                                    "Asia-Pacific markets trade mixed as Trump softens tariff stance - CNBC",
                                    publishedAt: DateTime.now(),
                                    content:
                                    "Before any trade agreements are reached with India and Japan, \"large U.S. companies will likely try to cut idiosyncratic deals with the White House, perpetuating the policy patchwork"),
                              ),
                            );
                          }),
                    ),

                  ],
                ),
              )),
        ));
  }
}
