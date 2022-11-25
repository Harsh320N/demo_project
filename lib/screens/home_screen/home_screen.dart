import 'package:demo_project/common/model/data_model.dart';
import 'package:demo_project/common/widget/decoration.dart';
import 'package:demo_project/common/widget/image_widget.dart';
import 'package:demo_project/common/widget/text_styles.dart';
import 'package:demo_project/network/data.dart';
import 'package:flutter/material.dart';

import '../../utils/utils_export.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Property> property = [];
  PropertyModel? propertyModel;
  @override
  void initState() {
    propertyModel = PropertyModel.fromJson(data1);
    property = propertyModel!.data!.properties!;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    print("PROPERTY DATA ====== $propertyModel");
    Screen.setScreenSize(context);
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Center(
          child: Container(
            height: Screen.screenHeight * 0.95,
            width: Screen.screenWidth * 0.95,
            decoration: circularBoxDecoration(
              containerColor: Colors.indigo,
              circularRadius: 20.0,
            ),
            child: labels(text: property[0].addressArea),
          ),
        ),
      ),
      // body: Column(
      //   children: [
      //     Container(
      //       height: Screen.screenHeight,
      //       width: Screen.screenWidth,
      //       decoration: circularBoxDecoration(
      //         decorationImage: DecorationImage(
      //           image: Images.instance.networkImageProvider(
      //             data[0]['property_images'][0]['path'],
      //           ),
      //           fit: BoxFit.cover,
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
