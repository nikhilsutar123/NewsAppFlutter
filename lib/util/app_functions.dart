import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../data/news_model.dart';
import '../data/saved_news_model.dart';
import '../res/colors.dart';
import '../theme/app_theme.dart';

dismissKeyboard() {
  FocusManager.instance.primaryFocus?.unfocus();
}

logConsole(dynamic message) => log("in-app message: $message");

showSnackBar(context, String msg,
    {Widget? icon, String? label, VoidCallback? onPress}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Row(
      children: [
        icon ??
            Offstage(
              offstage: true,
              child: Container(),
            ),
        const SizedBox(
          width: 5,
        ),
        Flexible(
          child: Text(
            msg,
            style: textThemeSnackBar(14),
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
        ),
      ],
    ),
    action: (onPress != null)
        ? SnackBarAction(
            textColor: Appcolor.black, label: label ?? "", onPressed: onPress)
        : null,
  ));
}

String formatDate(DateTime? date) {
  return DateFormat("dd MMM yyyy").format(date!.toLocal()).toString();
}

bool isSaved(List<SavedNewsModel> savedNews, Article article) {
  return savedNews.any((saved) => saved.url == article.url);
}

void navigateToPage(BuildContext context, Widget page) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => page),
  );
}

Future<void> showCircularDialog(BuildContext context) async {
  return await showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return PopScope(
        canPop: true,
        onPopInvoked: (didPop) async => false,
        child: Center(
          child: Platform.isIOS
              ? CupertinoAlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(
                  color: Appcolor.primaryColor,
                ),
                const SizedBox(height: 16),
                const Text('Loading...'),
              ],
            ),
            actions: [
              CupertinoDialogAction(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          )
              : AlertDialog(
            content: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(
                  color: Appcolor.primaryColor,
                ),
                const SizedBox(width: 16),
                const Text('Loading...'),
              ],
            ),
          ),
        ),
      );
    },
  );
}

String concatString(String str) =>  str.replaceAll(" ", "+");
