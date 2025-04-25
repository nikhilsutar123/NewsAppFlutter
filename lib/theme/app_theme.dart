import 'package:flutter/painting.dart';
import '../res/colors.dart';

TextStyle textThemeBlack(double size, {FontStyle? style}) => TextStyle(
    fontSize: size,
    fontWeight: FontWeight.w400,
    fontStyle: style ?? FontStyle.normal,
    color: Appcolor.black);

