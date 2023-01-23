import 'dart:convert';

import 'package:user_listing_with_signup_demo/common/services/api_handler.dart';
import 'package:user_listing_with_signup_demo/network/api_utils.dart';

class SignUpRepo {
  ///Sign up Service
  static Future signUpService({
    String name = "",
    String email = "",
    String gender = "",
    String status = "",
  }) async {
    var responseBody = await API.apiHandler(
      url: ApiUtils.userDataUrl,
      body: jsonEncode({
        "name": name,
        "gender": gender,
        "email": email,
        "status": "active",
      }),
      requestType: RequestType.post,
    );
    if (responseBody != null) {
      print("RESPONSE AT SERVICE ======  $responseBody");
      return responseBody;
    }
    return null;
  }
}
