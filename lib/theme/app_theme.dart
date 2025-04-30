import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../res/colors.dart';

TextStyle textThemeBlack(double size, {FontStyle? style}) => TextStyle(
    fontSize: size,
    fontWeight: FontWeight.w400,
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
