import 'package:flutter/material.dart';
import 'package:ctoshackcity/components/buttonHacking.dart';
import 'package:ctoshackcity/theme/colors.dart';
import 'package:new_version_plus/new_version_plus.dart';
import 'package:ctoshackcity/views/hacking/traffic_lights.dart';
import 'package:ctoshackcity/views/hacking/blackout.dart';
import 'package:ctoshackcity/views/hacking/send_virus.dart';
import 'package:ctoshackcity/views/hacking/hack_car.dart';
import 'package:ctoshackcity/views/hacking/vuln_system.dart';
import 'package:ctoshackcity/views/hacking/game.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;
  int? pressedButtonIndex;

  List images = [
    'traffic_light',
    'blackout',
    'send_virus',
    'car',
    'vuln',
    'game'
  ];

  List<Widget> views = [
    TrafficLights(),
    Blackout(),
    Virus(),
    Hackcar(),
    VulnSystem(),
    Game()
  ];

  Future<void> checkForUpdate(BuildContext context) async {
    final newVersion = NewVersionPlus(androidId: 'com.dnv.ctos');
    final status = await newVersion.getVersionStatus();
    if (status != null && status.canUpdate) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder:
            (context) => AlertDialog(
          backgroundColor: ColorsPalette[4],
          title: Text(
            'New version available',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OCR',
              fontWeight: FontWeight.w900,
              fontSize: 24),
          ),
          actions: [
            ElevatedButton(
              onPressed: () async {
                Navigator.pop(context);
                await newVersion.launchAppStore(
                  'https://play.google.com/store/apps/details?id=com.dnv.ctos',
                );
              },
              child: Text(
                'Update',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'OCR',
                    fontWeight: FontWeight.w900,
                    fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: ColorsPalette[0],
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkForUpdate(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 25,
                color: Colors.white,
              ),
              Container(
                  margin: EdgeInsets.only(top: 60),
                  child: Image.asset('assets/backgrounds/${images[selectedIndex]}.png',
                      scale: 0.35)),
              Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      itemCount: images.length,
                      scrollDirection: Axis.horizontal,
                      padding:
                          EdgeInsets.symmetric(horizontal: 13, vertical: 7),
                      itemBuilder: (context, index) {
                        return ButtonHack(
                            image: 'assets/menu/${images[index]}.png',
                            isPressed: pressedButtonIndex == index,
                            onTap: () async {
                              setState(() {
                                pressedButtonIndex = index;
                              });
                              await Future.delayed(Duration(milliseconds: 200));
                              setState(() => pressedButtonIndex = null);
                              if (selectedIndex == index) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => views[index]));
                              } else {
                                setState(() {
                                  selectedIndex = index;
                                });
                              }
                            });
                      }))
            ]));
  }
}
