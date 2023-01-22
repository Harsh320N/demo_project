import 'package:flutter/material.dart';
import 'package:user_listing_with_signup_demo/common/widgets/decoration.dart';
import 'package:user_listing_with_signup_demo/common/widgets/text_styles.dart';
import 'package:user_listing_with_signup_demo/utils/utils_export.dart';

Widget button({
  required String text,
  void Function()? onTap,
  double buttonHeight = 45.0,
  double buttonWidth = 350.0,
  Color fontColor = white,
  FontWeight fontWeight = FontWeight.normal,
  double fontSize = 14.0,
}) =>
    GestureDetector(
      onTap: onTap,
      child: Container(
        height: buttonHeight,
        width: buttonWidth,
        decoration: circularBoxDecoration(
          circularRadius: 15.0,
          gradient: const LinearGradient(
            colors: [
              primaryColor,
              secondaryColor,
            ],
          ),
        ),
        child: Center(
          child: labels(
            text: text,
            color: fontColor,
            fontWeight: fontWeight,
            size: fontSize,
          ),
        ),
      ),
    );
