import 'package:demo_project/common/model/data_model.dart';
import 'package:demo_project/common/widget/decoration.dart';
import 'package:demo_project/common/widget/padding_margin.dart';
import 'package:demo_project/common/widget/property_card.dart';
import 'package:demo_project/common/widget/text_styles.dart';
import 'package:demo_project/network/data.dart';
import 'package:flutter/material.dart';
import 'package:swiping_card_deck/swiping_card_deck.dart';

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
    propertyModel = PropertyModel.fromJson(data);
    property = propertyModel!.data!.properties!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Screen.setScreenSize(context);
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Center(
          child: Container(
            height: Screen.screenHeight * 0.9,
            width: Screen.screenWidth * 0.9,
            decoration: circularBoxDecoration(
              circularRadius: 20.0,
            ),
            // child: ClipRRect(
            //   borderRadius: BorderRadius.circular(20.0),
            //   child: SingleChildScrollView(
            //     child: SwipingCardDeck(
            //       cardDeck: [
            //         for(int index=0; index < property.length; index++)
            //           Card(
            //             margin: EdgeInsets.zero,
            //             shape: RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(20.0),
            //             ),
            //             child: PropertyCard(
            //               addressArea: property[index].addressArea,
            //               bathrooms: property[index].bathrooms,
            //               bedrooms: property[index].bathrooms,
            //               depositAmount: property[index].depositAmount,
            //               nearestLocation: property[index].nearestLocation,
            //               status: property[index].status,
            //               propertyImage: property[index].propertyImages![0].path,
            //               profileImage: property[index].user!.profileImage,
            //               nearestLocationTime: property[index].nearestLocationTime,
            //               description: property[index].description,
            //               location: property[index].addressStreetName,
            //               keyFeature: property[index].keyFeatures,
            //               propertyImageElement: property[index].propertyImages,
            //             ),
            //           ),
            //       ],
            //       onDeckEmpty: () => debugPrint("Card deck empty"),
            //       onLeftSwipe: (Card card) => debugPrint("Swiped left!"),
            //       onRightSwipe: (Card card) => debugPrint("Swiped right!"),
            //       swipeThreshold: MediaQuery.of(context).size.width / 4,
            //       minimumVelocity: 1000,
            //       cardWidth: 200,
            //       rotationFactor: 0.8 / 3.14,
            //       swipeAnimationDuration: const Duration(milliseconds: 0),
            //     ),
            //   ),
            // ),
            child: PageView.builder(
              itemCount: property.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
              PropertyCard(
                addressArea: property[index].addressArea,
                bathrooms: property[index].bathrooms,
                bedrooms: property[index].bathrooms,
                depositAmount: property[index].depositAmount,
                nearestLocation: property[index].nearestLocation,
                status: property[index].status,
                propertyImage: property[index].propertyImages![0].path,
                profileImage: property[index].user!.profileImage,
                nearestLocationTime: property[index].nearestLocationTime,
                description: property[index].description,
                location: property[index].addressStreetName,
                keyFeature: property[index].keyFeatures,
                propertyImageElement: property[index].propertyImages,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
