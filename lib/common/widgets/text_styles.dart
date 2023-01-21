import 'package:flutter/material.dart';

import '../../utils/utils_export.dart';

Widget labels({
  required String text,
  Color color = iconTextColor,
  FontWeight fontWeight = FontWeight.normal,
  double? height,
  double size = 16.0,
  double? letterSpacing,
  int maxLine = 1,
  TextAlign? textAlign,
  TextDecoration? decoration,
  TextOverflow? overflow,
  double wordSpacing = 0,
  Color decorationColor = transparent,
}) =>
    Text(
      text,
      textAlign: textAlign,
      maxLines: maxLine,
      overflow: overflow,
      style: defaultTextStyle(
        color: color,
        fontWeight: fontWeight,
        height: height,
        size: size,
        letterSpace: letterSpacing,
        decoration: decoration,
        wordSpacing: wordSpacing,
        decorationColor: decorationColor,
      ),
    );

TextStyle defaultTextStyle({
  Color color = iconTextColor,
  Color decorationColor = transparent,
  double? height,
  double size = 14.0,
  double? wordSpacing,
  double? letterSpace,
  FontWeight fontWeight = FontWeight.normal,
  TextDecoration? decoration,
}) =>
    TextStyle(
      color: color,
      height: height,
      fontSize: size,
      letterSpacing: letterSpace,
      fontWeight: fontWeight,
      fontFamily: "OpenSans",
      decoration: decoration,
      wordSpacing: wordSpacing,
      decorationColor: decorationColor,
      decorationThickness: 2.0,
    );

Widget dashboardTitles(String text) => labels(
      text: text,
      color: white,
      fontWeight: FontWeight.w700,
      size: 16.0,
    );
