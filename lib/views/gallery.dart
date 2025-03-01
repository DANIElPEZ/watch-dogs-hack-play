import 'package:flutter/material.dart';
import 'package:watchdogshack/colors_and_shapes/colors.dart';

class GalleryView extends StatefulWidget {
  @override
  State<GalleryView> createState() => CameraState();
}

class CameraState extends State<GalleryView> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsPalette[3],
      child: Padding(
        padding: EdgeInsets.only(top: 27, bottom: 15, left: 10, right: 10),
        child: CarouselView.weighted(
            scrollDirection: Axis.vertical,
            flexWeights: <int>[1],
            children: List<Widget>.generate(10, (int index) {
          return Center(child: SizedBox(
            height: double.infinity,
              width: double.infinity,
              child: Image.asset('assets/gallery/watch-dogs${index+1}.png',
              fit: BoxFit.cover)));
        })),
      ),
    );
  }
}
