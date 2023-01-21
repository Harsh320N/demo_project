import 'package:flutter/material.dart';
import 'package:user_listing_with_signup_demo/utils/utils_export.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  @override
  Widget build(BuildContext context) {
    Screen.setScreenSize(context);
    return const Placeholder();
  }
}
