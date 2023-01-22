import 'package:get/get.dart';
import 'package:user_listing_with_signup_demo/screens/home_screen/controller/user_list_controller.dart';
import 'package:user_listing_with_signup_demo/screens/signup_screen/controller/gender_selection_controller.dart';
import 'package:user_listing_with_signup_demo/screens/signup_screen/controller/sign_up_controller.dart';

class BaseBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GenderSelectionController(), fenix: true);
    Get.lazyPut(() => SignupController(), fenix: true);
    Get.lazyPut(() => UserListController(), fenix: true);
  }
}
