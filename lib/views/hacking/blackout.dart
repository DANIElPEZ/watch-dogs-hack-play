import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:watchdogshack/colors_and_shapes/colors.dart';

class Blackout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => stateBlackout();
}

class stateBlackout extends State<Blackout> {
  final AudioPlayer audioPlayer = AudioPlayer();
  bool stateActivationBtn = true;
  int stateActivation = 1;

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
              color: ColorsPalette[1],
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 60),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 60),
                        child: Image.asset(
                            'assets/backgrounds/blackout$stateActivation.png',
                            scale: 0.4)),
                    AnimatedOpacity(
                      duration: Duration(milliseconds: 10),
                      opacity: stateActivationBtn ? 1 : 0,
                      child: ElevatedButton(
                          onPressed: stateActivationBtn?() async {
                            try {
                              await audioPlayer.stop();
                              await audioPlayer
                                  .play(AssetSource('sound/hack_sound.mp3'));
                            } catch (e) {
                              print(e);
                            }
                            setState(() => stateActivationBtn = false);

                            int count = 0;
                            Timer.periodic(Duration(milliseconds: 220), (timer) {
                              setState(() {
                                stateActivation = 1;
                              });

                              Future.delayed(Duration(milliseconds: 100), () {
                                setState(() {
                                  stateActivation = 2;
                                });
                              });

                              count++;
                              if (count >= 6) {
                                timer.cancel();
                              }
                            });
                          }:null,
                          style: ElevatedButton.styleFrom(
                          minimumSize: Size(280, 40),
                              backgroundColor: stateActivationBtn
                                  ? ColorsPalette[4]
                                  : ColorsPalette[1],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero)),
                          child: Text('BLACKOUT',
                              style: TextStyle(
                                  color: stateActivationBtn
                                      ? ColorsPalette[2]
                                      : ColorsPalette[1],
                                  fontFamily: 'OCR',
                                  fontWeight: FontWeight.w900,
                                  fontSize: 40)))
                    )
                  ])))
    );
  }
}
