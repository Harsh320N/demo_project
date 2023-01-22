import 'package:flutter/material.dart';
import 'package:user_listing_with_signup_demo/common/widgets/widget_export.dart';

import '../../utils/utils_export.dart';

AppBar appbars({
  String title = "",
}) =>
    AppBar(
      leading: const SizedBox(),
      titleSpacing: 0,
      title: labels(
        text: title,
        color: white,
        fontWeight: FontWeight.w700,
        size: 16.0,
      ),
      backgroundColor: fildColor,
      elevation: 0,
    );
