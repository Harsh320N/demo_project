import 'package:flutter/material.dart';

import '../../utils/utils_export.dart';

Widget divider({
  Color color = dividerColor,
  double thickness = 1.0,
  double height = 1.0,
}) =>
    Divider(
      color: color,
      thickness: thickness,
      height: height,
    );

Widget verticalDivider({
  Color color = dividerColor,
  double thickness = 1.0,
  double width = 1.0,
}) =>
    VerticalDivider(
      color: color,
      thickness: thickness,
      width: width,
    );