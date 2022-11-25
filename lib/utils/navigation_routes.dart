import 'package:demo_project/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

const String rootScreen = "/";
const String homeScreen = "HomeScreen";

Map<String, WidgetBuilder> routs = {
  homeScreen: (context) => const HomeScreen(),
};
