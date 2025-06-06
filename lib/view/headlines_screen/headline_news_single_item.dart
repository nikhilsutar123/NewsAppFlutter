import 'package:flutter/material.dart';
import 'package:news_app/data/news_model.dart';
import 'package:news_app/res/colors.dart';
import 'package:news_app/util/app_functions.dart';

import '../../res/constant.dart';
import '../../theme/app_theme.dart';

class HeadlineNewsSingleItem extends StatefulWidget {
  const HeadlineNewsSingleItem({this.article, super.key});

  final Article? article;

  @override
  State<HeadlineNewsSingleItem> createState() => _HeadlineNewsSingleItemState();
}

class _HeadlineNewsSingleItemState extends State<HeadlineNewsSingleItem> {
  bool isFavAdded = false;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final imageUrl = widget.article!.urlToImage;
    return SizedBox(
      width: double.infinity,
      height: deviceSize.height / 3.6,
      child: InkWell(
        onTap: () {},
        child: Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          elevation: 5,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Stack(
              fit: StackFit.expand,
              children: [
                imageUrl != null && imageUrl.isNotEmpty
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
                Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        Colors.black45,
                        Colors.transparent,
                        Colors.transparent,
                        Colors.black87
                      ])),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 18, horizontal: 8),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      formatDate(widget.article!.publishedAt),
                      softWrap: true,
                      maxLines: 3,
                      style: textThemeWhiteShadow(14,
                          style: FontStyle.normal,
                          blurRadius: 5,
                          color: Colors.black.withOpacity(0.7),
                          offset: const Offset(0, 1)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          isFavAdded = !isFavAdded;
                        });
                      },
                      icon: isFavAdded
                          ? const Icon(Icons.bookmark_added)
                          : const Icon(
                              Icons.bookmark,
                            ),
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          widget.article!.title.toString(),
                          maxLines: 3,
                          softWrap: true,
                          style: textThemeWhiteShadow(15,
                              style: FontStyle.normal,
                              blurRadius: 5,
                              color: Colors.black.withOpacity(0.9),
                              offset: const Offset(0, 1)),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "By ${widget.article!.author.toString()}",
                          maxLines: 3,
                          softWrap: true,
                          style: textThemeWhiteShadow(14,
                              style: FontStyle.normal,
                              blurRadius: 5,
                              color: Colors.black.withOpacity(0.9),
                              offset: const Offset(0, 1)),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
