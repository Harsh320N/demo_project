import 'package:flutter/material.dart';
import '../../utils/utils_export.dart';

Widget icons({
  required IconData icon,
  Color color = iconTextColor,
  double size = 24.0,
}) =>
    Icon(
      icon,
      color: color,
      size: size,
    );