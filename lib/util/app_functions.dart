import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
            style: textThemeBlack(14),
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
        ),
      ],
    ),
    action: (onPress != null)
        ? SnackBarAction(
            textColor: Appcolor.black, label: label ?? "", onPressed: onPress!)
        : null,
  ));
}

String formatDate(DateTime? date) {
  return DateFormat("dd MMM yyyy").format(date!.toLocal()).toString();
}
