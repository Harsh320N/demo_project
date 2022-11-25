import 'package:flutter/material.dart';

class Screen {
  static double _screenWidth = 0.0;
  static double _screenHeight = 0.0;
  static double _appbarHeight = 0.0;
  static double _bottomHeight = 0.0;

  static setScreenSize(BuildContext context) {
    _screenHeight = MediaQuery.of(context).size.height;
    _screenWidth = MediaQuery.of(context).size.width;
    _appbarHeight = MediaQuery.of(context).padding.top;
    _bottomHeight = MediaQuery.of(context).padding.bottom;
  }

  static double get screenWidth => _screenWidth;

  static double get screenHeight => _screenHeight;

  static double get appbarHeight => _appbarHeight;

  static double get bottomHeight => _bottomHeight;
}