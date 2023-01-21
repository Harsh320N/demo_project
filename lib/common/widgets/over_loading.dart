import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_listing_with_signup_demo/common/widgets/fading_cube_loader.dart';

class LoadingOverlay {
  void hide() {
    Get.back();
  }

  void show() {
    Get.dialog(
      const FullScreenLoader(),
      barrierDismissible: false,
      barrierColor: Colors.black26,
    );
  }

  Future<T> during<T>(Future<T> future) {
    show();
    return future.whenComplete(() => hide());
  }

  LoadingOverlay._create();

  factory LoadingOverlay.of() {
    return LoadingOverlay._create();
  }
}

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: const Center(
        child: AppLoader(),
      ),
    );
  }
}

class AppLoader extends StatelessWidget {
  const AppLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadingCubeLoader(),
          ],
        ),
      ),
    );
  }
}