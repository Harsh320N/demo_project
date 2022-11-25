import 'package:demo_project/utils/utils_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

main() {
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: homeScreen,
      routes: routs,
      builder: (context, child) {
        return ScrollConfiguration(behavior: MyBehavior(), child: child!);
      },
    ),
  );
}

class MyBehavior extends ScrollBehavior {
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
