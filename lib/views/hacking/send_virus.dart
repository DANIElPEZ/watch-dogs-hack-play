import 'package:flutter/material.dart';
import 'package:ctoshackcity/theme/colors.dart';
import 'package:ctoshackcity/utils/ad_utils.dart';
import 'package:ctoshackcity/utils/replay_sound.dart';

class Virus extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => stateVirus();
}

class stateVirus extends State<Virus> {
  List<String> virusList = ['TROJAN','SPYWARE','RANSOMWARE','WORM'];
  String dropDownValue = 'TROJAN';

  Map<String, String> images = {
    'TROJAN':'trojan',
    'SPYWARE': 'spyware',
    'RANSOMWARE':'ramsonware',
    'WORM':'worm'
  };

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
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 60),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 60),
                      child: Image.asset('assets/backgrounds/${images[dropDownValue]}.png',
                          scale: 0.7)),
                  Column(children: [
                    DropdownButton(
                        dropdownColor: ColorsPalette[4],
                        value: dropDownValue,
                        icon: Icon(Icons.coronavirus, color: ColorsPalette[2]),
                        items: virusList
                            .map<DropdownMenuItem<String>>((String value) =>
                            DropdownMenuItem(
                                value: value,
                                child: Text(value,
                                    style: TextStyle(
                                        color: ColorsPalette[2],
                                        fontFamily: 'OCR',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 25)
                                )))
                            .toList(),
                        onChanged: (String? value) =>setState(() => dropDownValue = value!)
                    ),
                    SizedBox(height: 27),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () async {
                            replay_sound();
                          },
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: ColorsPalette[4],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero)),
                          child: Text('EXECUTE',
                              style: TextStyle(
                                  color: ColorsPalette[2],
                                  fontFamily: 'OCR',
                                  fontWeight: FontWeight.w900,
                                  fontSize: 35))),
                    )
                  ])
                ])));
  }
}
