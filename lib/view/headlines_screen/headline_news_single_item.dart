import 'package:flutter/material.dart';
import 'package:news_app/data/news_model.dart';
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
    return SizedBox(
      width: double.infinity,
      height: deviceSize.height / 3.6,
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        elevation: 5,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image(
                fit: BoxFit.cover,
                image: widget.article!.urlToImage!.isEmpty
                    ? const AssetImage(Constant.placeholder)
                    : NetworkImage(widget.article!.urlToImage.toString()),
              ),
              Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Colors.black45,
                      Colors.transparent,
                      Colors.transparent,
                      Colors.black45
                    ])),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 18, horizontal: 8),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    widget.article!.author!.isEmpty
                        ? formatDate(widget.article!.publishedAt)
                        : "By ${widget.article!.author} ${Constant.blackDot} ${formatDate(widget.article!.publishedAt)}",
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
                        ? const Icon(Icons.favorite)
                        : const Icon(
                            Icons.favorite_border,
                          ),
                    color: isFavAdded ? Colors.red : Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    widget.article!.title.toString(),
                    maxLines: 3,
                    softWrap: true,
                    style: textThemeWhiteShadow(16,
                        style: FontStyle.normal,
                        blurRadius: 5,
                        color: Colors.black.withOpacity(0.9),
                        offset: const Offset(0, 1)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
