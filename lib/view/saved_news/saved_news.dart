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
                decoration: BoxDecoration(
                    borderRadius:  BorderRadius.circular(10),
                border: Border.all(color: Appcolor.black)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "Inside the multi-day meltdown at Newark airport - CNN",
                      style: textThemeBlack(14),
                    ),
                    Text(
                      "By Nikhil Sutar ${Constant.blackDot} 26 Apr 2025",
                      style: textThemeWhiteShadow(14,
                          style: FontStyle.normal,
                          blurRadius: 5,
                          color: Colors.black.withOpacity(0.7),
                          offset: const Offset(0, 1)),
                    ),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(image: AssetImage('asset/image/news.jpg')),
                )
              ],
            ),
          ),
        ))
    ,
    );
  }
}
