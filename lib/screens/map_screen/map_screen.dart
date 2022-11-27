import 'package:demo_project/common/widget/google_map_widget.dart';
import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Hero(
        tag: "mep",
        child: GoogleMapWidget(goToLocation: true),
      ),
    );
  }
}
