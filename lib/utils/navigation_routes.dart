import 'package:demo_project/screens/home_screen/home_screen.dart';
import 'package:demo_project/screens/map_screen/map_screen.dart';
import 'package:flutter/material.dart';

const String rootScreen = "/";
const String homeScreen = "HomeScreen";
const String mapScreen = "MapScreen";

Map<String, WidgetBuilder> routs = {
  homeScreen: (context) => const HomeScreen(),
  mapScreen:(context)=>const MapScreen(),
};
