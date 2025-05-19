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
    final deviceSize = MediaQuery.of(context).size;
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: const Image(
                    image: AssetImage('lib/asset/image/news.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Chip(
                      label: Text(
                        "26 Apr 2025",
                        style: textThemeWhite(12),
                      ),
                      padding: const EdgeInsets.all(0),
                      backgroundColor: Colors.deepPurple.shade300,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: const BorderSide(color: Colors.transparent)),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity: VisualDensity.compact,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Inside the multi-day meltdown at Newark airport - CNN",
                      style: textThemeBlackBold(16),
                      softWrap: true,
                      maxLines: 2,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "By Nikhil Sutar, Nipun, Nikhil",
                      softWrap: true,
                      maxLines: 2,
                      style: textThemeGrey(14),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
