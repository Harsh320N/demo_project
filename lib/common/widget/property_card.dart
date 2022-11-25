import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:demo_project/common/model/data_model.dart';
import 'package:demo_project/common/widget/decoration.dart';
import 'package:demo_project/common/widget/icon_widget.dart';
import 'package:demo_project/common/widget/image_widget.dart';
import 'package:demo_project/common/widget/padding_margin.dart';
import 'package:demo_project/common/widget/spaces.dart';
import 'package:demo_project/common/widget/text_styles.dart';
import 'package:demo_project/utils/utils_export.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PropertyCard extends StatefulWidget {
  final String propertyImage;
  final String addressArea;
  final String profileImage;
  final String status;
  final int depositAmount;
  final String nearestLocation;
  final String nearestLocationTime;
  final String description;
  final String location;
  final List<KeyFeature>? keyFeature;
  final int bedrooms;
  final int bathrooms;
  final List<PropertyImageElement>? propertyImageElement;

  const PropertyCard({
    Key? key,
    this.propertyImage = "",
    this.addressArea = "",
    this.profileImage = "",
    this.status = "",
    this.depositAmount = 0,
    this.nearestLocation = "",
    this.nearestLocationTime = "",
    this.description = "",
    this.location = "",
    this.keyFeature,
    this.bedrooms = 0,
    this.bathrooms = 0,
    this.propertyImageElement,
  }) : super(key: key);

  @override
  State<PropertyCard> createState() => _PropertyCardState();
}

class _PropertyCardState extends State<PropertyCard> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = const CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  @override
  Widget build(BuildContext context) {
    CarouselController controller = CarouselController();
    int current = 0;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: Screen.screenHeight * 0.9,
            width: Screen.screenWidth * 0.9,
            padding: paddingAll(20.0),
            decoration: circularBoxDecoration(
              circularRadius: 20.0,
              decorationImage: DecorationImage(
                image:
                    Images.instance.networkImageProvider(widget.propertyImage),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        labels(
                          text: widget.addressArea,
                          color: white,
                          fontWeight: FontWeight.w600,
                          size: 18.0,
                        ),
                        verticalSpace(10.0),
                        _statusBanner(
                          status: widget.status,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        _profile(
                          profilePicture: widget.profileImage,
                        ),
                        verticalSpace(30.0),
                        icons(
                          icon: icPaperPlane,
                          color: white,
                          size: 30.0,
                        ),
                        verticalSpace(30.0),
                        icons(
                          icon: icPlayArrowRounded,
                          color: white,
                          size: 55.0,
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        labels(
                          text: "€ ${widget.depositAmount.toString()}",
                          color: white,
                          size: 18.0,
                          fontWeight: FontWeight.w600,
                        ),
                        verticalSpace(10.0),
                        Row(
                          children: [
                            icons(
                              icon: icBedRounded,
                              color: pinkAccent,
                              size: 20.0,
                            ),
                            horizontalSpace(5.0),
                            labels(
                              text: widget.bedrooms.toString(),
                              color: white,
                              fontWeight: FontWeight.w700,
                              size: 10.0,
                            ),
                            horizontalSpace(5.0),
                            icons(
                              icon: icBathtubRounded,
                              color: blueAccent,
                              size: 20.0,
                            ),
                            horizontalSpace(5.0),
                            labels(
                              text: widget.bathrooms.toString(),
                              color: white,
                              fontWeight: FontWeight.w700,
                              size: 10.0,
                            ),
                            horizontalSpace(5.0),
                            labels(
                              text: "•",
                              color: white,
                              fontWeight: FontWeight.w700,
                              size: 10.0,
                            ),
                            horizontalSpace(5.0),
                            labels(
                              text: widget.nearestLocation,
                              fontWeight: FontWeight.w600,
                              size: 10.0,
                              color: white,
                            ),
                          ],
                        ),
                        verticalSpace(10.0),
                        Row(
                          children: [
                            icons(
                              icon: icDirectionsWalkRounded,
                              color: red,
                              size: 20.0,
                            ),
                            horizontalSpace(5.0),
                            labels(
                              text: "•",
                              color: white,
                              fontWeight: FontWeight.w700,
                              size: 10.0,
                            ),
                            horizontalSpace(5.0),
                            labels(
                              text: "${widget.nearestLocationTime} Walk",
                              fontWeight: FontWeight.w600,
                              size: 10.0,
                              color: white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: paddingSymmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(20.0),
                heading("Description"),
                subText(widget.description),
                verticalSpace(20.0),
                heading("Location"),
                subText(widget.location),
                verticalSpace(15.0),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, mapScreen);
                  },
                  child: SizedBox(
                    height: 200.0,
                    width: double.infinity,
                    child: GoogleMap(
                      mapType: MapType.hybrid,
                      initialCameraPosition: _kGooglePlex,
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                    ),
                  ),
                ),
                verticalSpace(20.0),
                heading("Key features & amenities"),
                verticalSpace(10.0),
                SizedBox(
                  height: 130.0,
                  child: ListView.builder(
                    itemCount: widget.keyFeature!.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Padding(
                      padding: paddingOnly(
                        left: index == 0 ? 0 : 15.0,
                      ),
                      child: _featuresBox(
                        icon: widget.keyFeature![index].colorIconUrl,
                        name: widget.keyFeature![index].name,
                      ),
                    ),
                  ),
                ),
                verticalSpace(20.0),
                heading("Gallery"),
                verticalSpace(10.0),
                // CarouselSlider.builder(
                //   carouselController: controller,
                //   itemCount: widget.propertyImageElement!.length,
                //   options: CarouselOptions(
                //       enableInfiniteScroll: false,
                //       autoPlay: false,
                //       enlargeCenterPage: false,
                //       viewportFraction: 1.0,
                //       aspectRatio: 1.8,
                //       initialPage: 0,
                //       onPageChanged: (index, reason) {
                //         setState(() {
                //           current = index;
                //         });
                //       }),
                //   itemBuilder: (BuildContext context, int itemIndex,
                //           int pageViewIndex) =>
                //       Container(
                //     decoration: circularBoxDecoration(
                //       circularRadius: 20.0,
                //       decorationImage: DecorationImage(
                //         image: Images.instance.networkImageProvider(
                //             widget.propertyImageElement![itemIndex].path),
                //         fit: BoxFit.cover,
                //       ),
                //     ),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: widget.propertyImageElement!
                //           .asMap()
                //           .entries
                //           .map((entry) {
                //         return Container(
                //           width: 12.0,
                //           height: 12.0,
                //           margin: const EdgeInsets.symmetric(
                //               vertical: 8.0, horizontal: 4.0),
                //           decoration: BoxDecoration(
                //               shape: BoxShape.circle,
                //               color: (Theme.of(context).brightness == Brightness.dark
                //                       ? Colors.white
                //                       : Colors.black)
                //                   .withOpacity(
                //                       current == entry.key ? 0.9 : 0.4)),
                //         );
                //       }).toList(),
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 200.0,
                  child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.propertyImageElement!.length,
                    onPageChanged: (value) {
                      setState(() {
                        current = value;
                      });
                    },
                    itemBuilder: (context, index) => Container(
                      decoration: circularBoxDecoration(
                        circularRadius: 20.0,
                        decorationImage: DecorationImage(
                          image: Images.instance.networkImageProvider(
                              widget.propertyImageElement![index].path),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: indicators(widget.propertyImageElement!.length, current),
                // ),
                verticalSpace(20.0),
                heading("Basic info"),
                verticalSpace(10.0),
                Table(
                  children: [
                    _table(
                      clOne: "Listing Type",
                      clTwo: "Room",
                    ),
                    _table(
                      clOne: "Property Type",
                      clTwo: "Flat",
                    ),
                    _table(
                      clOne: "Room Type",
                      clTwo: "Single Room",
                    ),
                    _table(
                      clOne: "Move in date",
                      clTwo: "Available now",
                    ),
                    _table(
                      clOne: "Length of stay",
                      clTwo: "Short let",
                    ),
                    _table(
                      clOne: "Type",
                      clTwo: "Furnished",
                    ),
                    _table(
                      clOne: "For Student",
                      clTwo: "Yes",
                    ),
                    _table(
                      clOne: "Deposit amount",
                      clTwo: widget.depositAmount.toString(),
                    ),
                    _table(
                      clOne: "Current Flatmates",
                      clTwo: "Room",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _table({
    String clOne = "",
    String clTwo = "",
  }) =>
      TableRow(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [subText(clOne),verticalSpace(10.0),],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [heading(clTwo,size: 11.0,),verticalSpace(10.0),],
        ),
      ]);

  List<Widget> indicators(imagesLength, currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return Container(
        margin: const EdgeInsets.all(3),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: currentIndex == index ? Colors.black : Colors.black26,
            shape: BoxShape.circle),
      );
    });
  }

  _featuresBox({
    String icon = "",
    String name = "",
  }) =>
      Container(
        width: 150.0,
        padding: paddingSymmetric(
          vertical: 10.0,
          horizontal: 20.0,
        ),
        decoration: circularBoxDecoration(
          border: Border.all(
            width: 2.0,
            color: pinkAccent,
          ),
          circularRadius: 20.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Images.instance.networkImage(
              url: icon,
              height: 50.0,
              width: 50.0,
            ),
            verticalSpace(15.0),
            labels(
              text: name,
              overflow: TextOverflow.ellipsis,
              size: 11.0,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      );

  _profile({
    String profilePicture = "",
  }) =>
      SizedBox(
        height: 65.0,
        width: 65.0,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 55.0,
                width: 55.0,
                decoration: circularBoxDecoration(
                  boxShape: BoxShape.circle,
                  decorationImage: DecorationImage(
                    image: Images.instance.networkImageProvider(
                      profilePicture,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 25.0,
                width: 25.0,
                decoration: circularBoxDecoration(
                  boxShape: BoxShape.circle,
                  containerColor: pinkAccent,
                ),
                child: Center(
                    child: icons(
                  icon: icMessageRounded,
                  size: 13.0,
                  color: white,
                )),
              ),
            ),
          ],
        ),
      );

  _statusBanner({
    String status = "",
  }) =>
      Container(
        padding: paddingSymmetric(
          horizontal: 10.0,
          vertical: 6.0,
        ),
        decoration: circularBoxDecoration(
          containerColor: lightGreen,
          circularRadius: 7.0,
        ),
        child: labels(
          text: status,
          color: white,
          size: 9.0,
        ),
      );
}
