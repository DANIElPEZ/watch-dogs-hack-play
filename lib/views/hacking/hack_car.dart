import 'package:flutter/material.dart';
import 'package:ctoshackcity/theme/colors.dart';
import 'package:ctoshackcity/utils/replay_sound.dart';
import 'package:ctoshackcity/utils/ad_utils.dart';

class Hackcar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => stateHackcar();
}

class stateHackcar extends State<Hackcar> {
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
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(25),
            child: Container(
              color: ColorsPalette[2],
            )),
        body: Container(
            color: ColorsPalette[1],
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 80),
                      child: Image.asset('assets/backgrounds/car.png',
                          scale: 0.6)),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () async {
                          replay_sound();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ColorsPalette[4],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero)),
                        child: Text('HACK CAR',
                            style: TextStyle(
                                color: ColorsPalette[2],
                                fontFamily: 'OCR',
                                fontWeight: FontWeight.w900,
                                fontSize: 35))),
                  )
                ])));
  }
}
