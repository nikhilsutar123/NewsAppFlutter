import 'package:flutter/material.dart';
import 'package:news_app/theme/app_theme.dart';

import '../../res/colors.dart';
import '../../res/constant.dart';

class SavedNews extends StatefulWidget {
  const SavedNews({super.key});

  @override
  State<SavedNews> createState() => _SavedNewsState();
}

class _SavedNewsState extends State<SavedNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.all(8),
          // decoration: BoxDecoration(
          //     gradient: const LinearGradient(
          //       begin: Alignment.topCenter,
          //         end: Alignment.bottomCenter,
          //         colors: [
          //           Colors.black26,
          //           Colors.transparent,
          //           Colors.transparent,
          //           Colors.black45
          //         ])
          // ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Text(
                      "Inside the multi-day meltdown at Newark airport - CNN",
                      style: textThemeBlack(14),
                      softWrap: true,
                      maxLines: 2,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      "By Nikhil Sutar ${Constant.blackDot} 26 Apr 2025",
                      style: textThemeBlack(14),
                    ),
                  ),
                ],
              ),
              Flexible(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: const Image(
                    image: AssetImage('lib/asset/image/news.jpg'),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
