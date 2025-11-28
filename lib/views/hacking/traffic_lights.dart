import 'package:flutter/material.dart';
import 'package:ctoshackcity/theme/colors.dart';
import 'package:ctoshackcity/utils/replay_sound.dart';
import 'package:ctoshackcity/utils/ad_utils.dart';

class TrafficLights extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => stateTrafficLights();
}

class stateTrafficLights extends State<TrafficLights> {
  int excute = 1;
  final ad_helper=adUtils();

  @override
  void initState() {
    super.initState();
    ad_helper.loadRewardedAd(onReady: () {
      if (ad_helper.isAdLoaded && !ad_helper.initialAdShown) {
        ad_helper.showRewardedAd(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(25),
              child: Container(
                color: ColorsPalette[2],
              )),
          body: Container(
              color: ColorsPalette[excute],
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 80),
                      child: Image.asset('assets/backgrounds/traffic_light.png',
                          scale: 0.6),
                    ),
                    Column(children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.arrow_back_ios_sharp,
                                color: ColorsPalette[2], size: 40),
                            ElevatedButton(
                                onPressed: () async {
                                  replay_sound();
                                  setState(() => excute = 2);
                                  await Future.delayed(
                                      Duration(milliseconds: 100));
                                  setState(() => excute = 1);
                                },
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                    minimumSize: Size(230, 60),
                                    backgroundColor: ColorsPalette[4],
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero)),
                                child: Text('EXECUTE',
                                    style: TextStyle(
                                        color: ColorsPalette[2],
                                        fontFamily: 'OCR',
                                        fontWeight: FontWeight.w900,
                                        fontSize: 35))),
                            Icon(Icons.arrow_forward_ios_sharp,
                                color: ColorsPalette[2], size: 40)
                          ]),
                      Icon(Icons.keyboard_arrow_down_sharp,
                          color: ColorsPalette[2], size: 50)
                    ])
                  ])),
        ));
  }
}
