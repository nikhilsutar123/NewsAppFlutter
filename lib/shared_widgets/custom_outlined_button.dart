import 'package:flutter/material.dart';

import '../../res/colors.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final VoidCallback onPressed;
  final Color borderColor;
  final Color? backgroundColor;
  final TextStyle textStyle;
  final double? width;
  final double? height, borderRadius;
  final EdgeInsetsGeometry? margin;

  const CustomOutlinedButton(
      {super.key,
        required this.text,
        this.textAlign,
        required this.onPressed,
        required this.borderColor,
        required this.textStyle,
        this.backgroundColor,
        this.borderRadius,
        this.height,
        this.width,
        this.margin});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          margin: margin,
          height: height ?? 50,
          width: width, // Adjust the button width as per your requirement
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: backgroundColor ?? Appcolor.white,
              side: BorderSide(color: borderColor, width: 2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius ??
                    20.0), // Adjust the border radius as per your preference
              ),
            ),
            onPressed: onPressed,
            child: Text(
              text,
              style: textStyle,
              textAlign: textAlign,
            ),
          ),
        );
      },
    );
  }
}
