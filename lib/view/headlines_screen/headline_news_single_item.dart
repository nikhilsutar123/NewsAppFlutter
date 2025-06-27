import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/saved_news_bloc/saved_news_bloc.dart';
import 'package:news_app/bloc/saved_news_bloc/saved_news_event.dart';
import 'package:news_app/bloc/snack_bar_bloc/snackbar_bloc.dart';
import 'package:news_app/bloc/snack_bar_bloc/snackbar_event.dart';
import 'package:news_app/data/news_model.dart';
import 'package:news_app/data/saved_news_model.dart';
import 'package:news_app/res/colors.dart';
import 'package:news_app/service/hive_service.dart';
import 'package:news_app/util/app_functions.dart';
import 'package:news_app/view/webview/news_webview.dart';

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
  SavedNewsModel? model;
 //bool isTesting  = const bool.fromEnvironment("FLUTTER_TEST");
  @override
  void initState() {
    super.initState();
    model = SavedNewsModel(
      title: widget.article?.title,
      url: widget.article?.url,
      imageUrl: widget.article?.urlToImage,
      author: widget.article?.author,
      publishedAt: formatDate(widget.article!.publishedAt),
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final imageUrl = widget.article!.urlToImage;
    final savedNewsList = context.watch<SavedNewsBloc>().state.savedNews ?? [];
    isFavAdded = isSaved(savedNewsList, widget.article!);
    return SizedBox(
      width: double.infinity,
      height: deviceSize.height / 3.6,
      child: InkWell(
        onTap: () {
          final articleUrl = widget.article!.url;
          if (articleUrl!.isNotEmpty) {
            navigateToPage(
                context,
                NewsWebview(
                  url: articleUrl,
                ));
          } else {
            context
                .read<SnackbarBloc>()
                .add(ShowSnackbarEvent(message: "Url not available"));
          }
        },
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
                    ? CachedNetworkImage(
                        imageUrl: imageUrl.toString(),
                        fit: BoxFit.cover,
                        errorWidget: (context, error, stacktrace) {
                          return Image.asset(Constant.placeholder,
                              fit: BoxFit.cover);
                        },
                        progressIndicatorBuilder:
                            (context, string, downloadProgress) => Center(
                          child: CircularProgressIndicator(
                            value: downloadProgress.progress,
                          ),
                        ),
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
                        if (!isFavAdded) {
                          context
                              .read<SavedNewsBloc>()
                              .add(AddNewsToSaved(model!));
                          context
                              .read<SnackbarBloc>()
                              .add(ShowSnackbarEvent(message: "News Saved"));
                        } else {
                          context.read<SnackbarBloc>().add(
                              ShowSnackbarEvent(message: "News already Saved"));
                        }
                      },
                      icon: Icon(
                        isFavAdded ? Icons.bookmark_added : Icons.bookmark,
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
