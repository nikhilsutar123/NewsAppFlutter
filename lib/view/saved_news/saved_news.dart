import 'package:flutter/material.dart';
import 'package:news_app/data/saved_news_model.dart';
import 'package:news_app/theme/app_theme.dart';
import 'package:news_app/util/app_functions.dart';

import '../../res/colors.dart';
import '../../res/constant.dart';

class SavedNews extends StatefulWidget {
  const SavedNews({super.key, required this.savedNews});

  final SavedNewsModel savedNews;

  @override
  State<SavedNews> createState() => _SavedNewsState();
}

class _SavedNewsState extends State<SavedNews> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final imageUrl = widget.savedNews.imageUrl;
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: imageUrl != null && imageUrl.isNotEmpty
                      ? Image.network(
                          imageUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stacktrace) {
                            return Image.asset(Constant.placeholder,
                                fit: BoxFit.cover);
                          },
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        )
                      : Image.asset(Constant.placeholder, fit: BoxFit.cover),
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
                        widget.savedNews.publishedAt.toString(),
                        style: textThemeWhite(12),
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
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
                      widget.savedNews.title.toString(),
                      style: textThemeBlackBold(14),
                      softWrap: true,
                      maxLines: 3,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.savedNews.author.toString(),
                      softWrap: true,
                      maxLines: 2,
                      style: textThemeGrey(14),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              IconButton(
                  onPressed: () {
                    logConsole("deleted ${widget.savedNews}");
                  },
                  icon: const Icon(
                    Icons.delete_outline,
                    size: 30,
                  ))
            ],
          ),
        ),
      ],
    );
  }
}
