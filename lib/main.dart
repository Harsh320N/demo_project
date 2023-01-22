import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_listing_with_signup_demo/network/app_preference.dart';
import 'package:user_listing_with_signup_demo/utils/utils_export.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ///Portrait View
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  appPreference.init();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String email = appPreference.prefs!.getString("email") ?? "";
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: BaseBindings(),
      routes: routs,
      initialRoute: email.isNotEmpty ? homeScreen : signupScreen,
      builder: (context, child) {
        return ScrollConfiguration(behavior: MyBehavior(), child: child!);
      },
    );
  }
}

///Stop Scroll Glow
class MyBehavior extends ScrollBehavior {
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}