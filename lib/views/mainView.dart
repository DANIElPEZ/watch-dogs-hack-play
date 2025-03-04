import 'package:flutter/material.dart';
import 'package:watchdogshack/colors_and_shapes/colors.dart';
import 'package:watchdogshack/colors_and_shapes/shape_mid_bottombar.dart';
import 'package:watchdogshack/colors_and_shapes/lateral_options.dart';
import 'package:watchdogshack/views/gallery.dart';
import 'package:watchdogshack/views/home.dart';
import 'package:watchdogshack/views/search.dart';

class MainView extends StatefulWidget {
  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentView = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: ColorsPalette[1],
          height: 55,
          child: NavigationBar(
              onDestinationSelected: (int index) {
                setState(() {
                  currentView = index;
                });
              },
              backgroundColor: Colors.transparent,
              selectedIndex: currentView,
              indicatorColor: Colors.transparent,
              destinations: [
                NavigationDestination(
                    icon: CustomPaint(
                      painter: LateralOption(color: ColorsPalette[1]),
                      child: Transform.translate(
                        offset: Offset(0, 10),
                          child: Icon(Icons.image, color: ColorsPalette[2], size: 32)),
                    ),
                    label: ''),
                NavigationDestination(
                    icon: CustomPaint(
                      painter: TriangleMidOption(color: ColorsPalette[0]),
                      child: Icon(Icons.home, color: ColorsPalette[2], size: 40)
                    ),
                    label: ''),
                NavigationDestination(
                    icon: CustomPaint(
                      painter: LateralOption(color: ColorsPalette[1]),
                      child: Transform.translate(
                          offset: Offset(0, 10),
                          child: Icon(Icons.search, color: ColorsPalette[2], size: 32))
                    ),
                    label: '')
              ])),
      body: [GalleryView(), HomeView(), SearchView()][currentView]
    );
  }
}
