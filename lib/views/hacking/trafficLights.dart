import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:watchdogshack/colors_and_shapes/colors.dart';

class TrafficLights extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => stateTrafficLights();
}

class stateTrafficLights extends State<TrafficLights> {
  final AudioPlayer audioPlayer = AudioPlayer();
  int excute = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
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
                                try {
                                  await audioPlayer.stop();
                                  await audioPlayer
                                      .play(AssetSource('sound/hack_sound.mp3'));
                                } catch (e) {
                                  print(e);
                                }
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
                                      fontSize: 40))),
                          Icon(Icons.arrow_forward_ios_sharp,
                              color: ColorsPalette[2], size: 40)
                        ]),
                    Icon(Icons.keyboard_arrow_down_sharp,
                        color: ColorsPalette[2], size: 50)
                  ])
                ])));
  }
}
