import 'package:flutter/material.dart';
import '../res/colors.dart';

TextStyle textThemeBlack(double size, {FontStyle? style}) => TextStyle(
    fontSize: size,
    fontWeight: FontWeight.w400,
    fontStyle: style ?? FontStyle.normal,
    color: Appcolor.black);

TextStyle textThemePrimary(double size, {FontStyle? style}) => TextStyle(
    fontSize: size,
    fontWeight: FontWeight.w400,
    fontStyle: style ?? FontStyle.normal,
    color: Appcolor.primaryColor);

TextStyle textThemeSnackBar(double size, {FontStyle? style}) => TextStyle(
    fontSize: size,
    fontWeight: FontWeight.w400,
    fontStyle: style ?? FontStyle.normal,
    color: Appcolor.snackBarTextColor);

TextStyle textThemeGrey(double size, {FontStyle? style}) => TextStyle(
    fontSize: size,
    fontWeight: FontWeight.w400,
    fontStyle: style ?? FontStyle.normal,
    color: Appcolor.grey);

TextStyle textThemeBlackBold(double size, {FontStyle? style}) => TextStyle(
    fontSize: size,
    fontWeight: FontWeight.bold,
    fontStyle: style ?? FontStyle.normal,
    color: Appcolor.black);

TextStyle textThemeWhite(double size, {FontStyle? style}) => TextStyle(
    fontSize: size,
    fontWeight: FontWeight.w400,
    fontStyle: style ?? FontStyle.normal,
    color: Appcolor.white);

TextStyle textThemeWhiteShadow(double size,
        {FontStyle? style, double? blurRadius, Color? color, Offset? offset}) =>
    TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w400,
        fontStyle: style ?? FontStyle.normal,
        color: Appcolor.white,
        shadows: [
          Shadow(
              blurRadius: blurRadius ?? 0.0,
              color: color ?? Colors.black45,
              offset: offset ?? const Offset(0, 1))
        ]);
