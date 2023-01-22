import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:user_listing_with_signup_demo/common/model/user_list_model.dart';
import 'package:user_listing_with_signup_demo/common/widgets/spaces.dart';
import 'package:user_listing_with_signup_demo/common/widgets/text_styles.dart';
import 'package:user_listing_with_signup_demo/common/widgets/widget_export.dart';
import 'package:user_listing_with_signup_demo/screens/home_screen/controller/user_list_controller.dart';
import 'package:user_listing_with_signup_demo/utils/utils_export.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserListController userListController = Get.put(UserListController());

  @override
  void initState() {
    userListController.pagingController.addPageRequestListener((pageKey) {
      userListController.userList(pageKey);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbars(title: "User List"),
      backgroundColor: pageBackgroundColor,
      body: SafeArea(
        child: GetBuilder(
          builder: (UserListController controller) => PagedListView(
            pagingController: controller.pagingController,
            builderDelegate: PagedChildBuilderDelegate<dynamic>(
              firstPageProgressIndicatorBuilder: (context) => const AppLoader(),
              newPageProgressIndicatorBuilder: (context) => const AppLoader(),
              noMoreItemsIndicatorBuilder: (context) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  labels(
                    text: "No items found",
                    color: white,
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.center,
                    size: 20.0,
                    maxLine: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                  verticalSpace(10.0),
                  labels(
                    text: "Please try again later.",
                    color: white,
                    textAlign: TextAlign.center,
                    size: 13.0,
                    maxLine: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              noItemsFoundIndicatorBuilder: (context) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  labels(
                    text: "Something went wrong",
                    color: white,
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.center,
                    size: 20.0,
                    maxLine: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              newPageErrorIndicatorBuilder: (context) => icons(
                icon: icReportGmailErrorRounded,
                color: white,
              ),
              firstPageErrorIndicatorBuilder: (context) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  labels(
                    text: "Something went wrong",
                    color: white,
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.center,
                    size: 20.0,
                    maxLine: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                  verticalSpace(10.0),
                  labels(
                    text: "Please try again later.",
                    color: white,
                    textAlign: TextAlign.center,
                    size: 13.0,
                    maxLine: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              itemBuilder: (context, item, index) => Padding(
                padding: paddingSymmetric(
                  vertical: 15.0,
                  horizontal: 20.0,
                ),
                child: user(
                  email: item.email,
                  name: item.name,
                  gender: item.gender,
                  status: item.status,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget user({
    String name = '',
    String email = '',
    String status = '',
    String gender = '',
  }) =>
      Container(
        padding: paddingSymmetric(
          vertical: 10.0,
          horizontal: 10.0,
        ),
        decoration: circularBoxDecoration(
          circularRadius: 20.0,
          gradient: const LinearGradient(
            colors: [
              primaryColor,
              secondaryColor,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            richText(
              title: "Name: ",
              value: name,
            ),
            verticalSpace(10.0),
            richText(
              title: "Email: ",
              value: email,
            ),
            verticalSpace(10.0),
            richText(
              title: "Gender: ",
              value: gender,
            ),
            verticalSpace(10.0),
            richText(
              title: "Status: ",
              value: status,
            ),
          ],
        ),
      );

  richText({
    String title = "",
    String value = "",
  }) =>
      RichText(
        textAlign: TextAlign.start,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          text: title,
          style: defaultTextStyle(
            color: white,
            size: 16.0,
            fontWeight: FontWeight.w700,
          ),
          children: <TextSpan>[
            TextSpan(
              text: value,
              style: defaultTextStyle(
                color: white,
                size: 14.0,
              ),
            ),
          ],
        ),
      );
}
