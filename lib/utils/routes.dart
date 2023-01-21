import 'package:flutter/material.dart';
import 'package:user_listing_with_signup_demo/screens/home_screen/home_screen.dart';
import 'package:user_listing_with_signup_demo/screens/signup_screen/signup_screen.dart';

const String rootScreen = "/";
const String signupScreen = "SignupScreen";
const String homeScreen = "HomeScreen";

Map<String, WidgetBuilder> routs = {
  signupScreen: (context) => const SignupScreen(),
  homeScreen: (context) => const HomeScreen(),
};
