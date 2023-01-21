import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_listing_with_signup_demo/common/widgets/widget_export.dart';

import '../../utils/utils_export.dart';

errorSnack(
  String text, {
  IconData? icon,
}) =>
    Get.showSnackbar(
      GetSnackBar(
        messageText: listTile(
          leading: icons(
            icon: icon ?? icReportGmailErrorRounded,
            color: white,
          ),
          title: labels(
            text: text,
            color: white,
            maxLine: 5,
            size: 10.0,
            wordSpacing: 0.5,
            letterSpacing: 0.5,
          ),
          spaceLeadingTitle: 5.0,
          spaceTitleSubTitle: 0,
        ),
        duration: const Duration(seconds: 5),
        animationDuration: const Duration(milliseconds: 350),
        margin: const EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 10.0,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 15.0,
          horizontal: 15.0,
        ),
        borderRadius: 5.0,
      ),
    );
