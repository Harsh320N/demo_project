import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_listing_with_signup_demo/common/widgets/buttons.dart';
import 'package:user_listing_with_signup_demo/common/widgets/widget_export.dart';
import 'package:user_listing_with_signup_demo/screens/signup_screen/bloc/sign_up_bloc.dart';
import 'package:user_listing_with_signup_demo/screens/signup_screen/controller/gender_selection_controller.dart';
import 'package:user_listing_with_signup_demo/screens/signup_screen/controller/sign_up_controller.dart';
import 'package:user_listing_with_signup_demo/utils/utils_export.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  GenderSelectionController genderSelectionController =
      Get.put(GenderSelectionController());
  SignupController signupController = Get.put(SignupController());

  String nameValidate = "";
  String emailValidate = "";

  @override
  Widget build(BuildContext context) {
    bool first = signupController.nameController.text.isEmpty ||
            signupController.emailController.text.isEmpty
        ? true
        : false;
    Screen.setScreenSize(context);
    return GestureDetector(
      onTap: () => disposeKeyboard(),
      child: Scaffold(
        backgroundColor: pageBackgroundColor,
        body: SafeArea(
          child: Padding(
            padding: paddingSymmetric(horizontal: 20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  verticalSpace(Screen.screenHeight * 0.1),
                  Center(
                    child: labels(
                      text: "Sign up",
                      color: primaryColor,
                      size: 25.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  verticalSpace(50.0),
                  StreamBuilder<String>(
                      stream: SignUpBloc.nameStream,
                      initialData: "",
                      builder: (context, snapshot) {
                        nameValidate = snapshot.data!;
                        return Field(
                          onChanged: (value) {
                            first = false;
                            SignUpBloc.getName(value);
                          },
                          hint: "Enter Name",
                          controller: signupController.nameController,
                          validationMessage: snapshot.data!,
                          leftIcon: icons(
                            icon: icPersonCropCircleFill,
                            color: primaryColor,
                          ),
                        );
                      }),
                  verticalSpace(20.0),
                  StreamBuilder<String>(
                      stream: SignUpBloc.emailStream,
                      initialData: "",
                      builder: (context, snapshot) {
                        emailValidate = snapshot.data!;
                        return Field(
                          onChanged: (value) {
                            first = false;
                            SignUpBloc.getEmail(value);
                          },
                          hint: "Enter Email",
                          validationMessage: snapshot.data!,
                          controller: signupController.emailController,
                          inputType: TextInputType.emailAddress,
                          leftIcon: icons(
                            icon: icEnvelopeFill,
                            color: primaryColor,
                          ),
                        );
                      }),
                  verticalSpace(20.0),
                  GetBuilder(
                    builder: (GenderSelectionController controller) => Row(
                      children: [
                        Expanded(
                          child: genderBox(
                            "Male",
                            onTap: () {
                              controller.selected = "Male";
                            },
                            selected:
                                controller.selected == "Male" ? true : false,
                          ),
                        ),
                        horizontalSpace(10.0),
                        Expanded(
                          child: genderBox(
                            "Female",
                            onTap: () {
                              controller.selected = "Female";
                            },
                            selected:
                                controller.selected == "Female" ? true : false,
                          ),
                        ),
                      ],
                    ),
                  ),
                  verticalSpace(50.0),
                  button(
                    text: "Sign up",
                    buttonWidth: 180.0,
                    onTap: () {
                      SignUpBloc.getName(signupController.nameController.text);
                      SignUpBloc.getEmail(
                          signupController.emailController.text);
                      if (!first &&
                          nameValidate.isEmpty &&
                          emailValidate.isEmpty) {
                        signupController.signUp(
                          context,
                          status: "Active",
                          name: signupController.nameController.text,
                          email: signupController.emailController.text,
                          gender: genderSelectionController.selected,
                        );
                      } else {
                        SignUpBloc.getName(
                            signupController.nameController.text);
                        SignUpBloc.getEmail(
                            signupController.emailController.text);
                      }
                    },
                  ),
                  verticalSpace(20.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget genderBox(
    String text, {
    bool selected = false,
    void Function()? onTap,
  }) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          padding: paddingSymmetric(
            vertical: 8.0,
          ),
          decoration: circularBoxDecoration(
            containerColor: fildColor,
            circularRadius: 10.0,
            border: GradientBoxBorder(
              gradient: LinearGradient(
                colors:
                    selected ? [primaryColor, secondaryColor] : [white, white],
              ),
              width: 1.5,
            ),
          ),
          child: Center(
            child: labels(
              text: text,
              size: 12.0,
              fontWeight: FontWeight.w700,
              color: white,
            ),
          ),
        ),
      );
}
