import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_listing_with_signup_demo/common/services/repo/sign_up_repo/sign_up_service.dart';
import 'package:user_listing_with_signup_demo/common/widgets/widget_export.dart';
import 'package:user_listing_with_signup_demo/network/app_preference.dart';
import 'package:user_listing_with_signup_demo/utils/routes.dart';

class SignupController extends GetxController{
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  Future signUp(
      context, {
        String name = "",
        String email = "",
        String gender = "",
        String status = "",
      }) async {

    var response = await SignUpRepo.signUpService(
      name: name,
      email: email,
      gender: gender,
      status: status,
    );

    print("RESPONSE AT CONTROLLER ------ $response");

    if (response != null) {
      appPreference.prefs!.setString("email", name);
      disposeKeyboard();
      Get.offNamed(homeScreen);
    } else {
      return null;
    }
  }
}