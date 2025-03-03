import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:watchdogshack/colors_and_shapes/colors.dart';

class Hackcar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => stateHackcar();
}

class stateHackcar extends State<Hackcar> {
  final AudioPlayer audioPlayer = AudioPlayer();
  bool stateEngine = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                color: ColorsPalette[1],
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 60),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 80),
                          child: Image.asset('assets/backgrounds/car.png',
                              scale: 0.6)),
                      Row(children: [
                        Icon(Icons.arrow_back_ios_sharp,
                            color: ColorsPalette[2], size: 40),
                        Column(children: [
                          Icon(Icons.keyboard_arrow_up_sharp,
                              color: ColorsPalette[2], size: 40),
                          ElevatedButton(
                              onPressed: () async {
                                try {
                                  await audioPlayer
                                      .play(AssetSource('sound/hack.mp3'));
                                } catch (e) {
                                  print(e);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  maximumSize: Size(600, 100),
                                  backgroundColor: ColorsPalette[4],
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero)),
                              child: Text('OPEN DOOR',
                                  style: TextStyle(
                                      color: ColorsPalette[2],
                                      fontFamily: 'OCR',
                                      fontWeight: FontWeight.w900,
                                      fontSize: 30))),
                          SizedBox(height: 10),
                          ElevatedButton(
                              onPressed: () async {
                                try {
                                  await audioPlayer
                                      .play(AssetSource('sound/hack.mp3'));
                                } catch (e) {
                                  print(e);
                                }
                                setState(() => stateEngine = !stateEngine);
                              },
                              style: ElevatedButton.styleFrom(
                                  maximumSize: Size(800, 100),
                                  backgroundColor: ColorsPalette[4],
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero)),
                              child: Text(
                                  stateEngine ? 'ENGINE ON' : 'ENGINE OFF',
                                  style: TextStyle(
                                      color: ColorsPalette[2],
                                      fontFamily: 'OCR',
                                      fontWeight: FontWeight.w900,
                                      fontSize: 30))),
                          Icon(Icons.keyboard_arrow_down_sharp,
                              color: ColorsPalette[2], size: 40),
                        ]),
                        Icon(Icons.arrow_forward_ios_sharp,
                            color: ColorsPalette[2], size: 40)
                      ])
                    ]))));
  }
}
