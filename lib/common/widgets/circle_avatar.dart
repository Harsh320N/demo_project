import 'package:flutter/material.dart';

import '../../utils/utils_export.dart';

Widget circleAvatar({
  double radius = 20.0,
  ImageProvider<Object>? backgroundImage,
  Color bgColor = iconTextColor,
  Widget? child,
}) =>
    CircleAvatar(
      radius: radius,
      backgroundImage: backgroundImage,
      backgroundColor: bgColor,
      child: child,
    );