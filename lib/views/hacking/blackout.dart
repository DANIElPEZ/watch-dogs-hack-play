import 'dart:async';
import 'package:ctoshackcity/utils/replay_sound.dart';
import 'package:flutter/material.dart';
import 'package:ctoshackcity/theme/colors.dart';

class Blackout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => stateBlackout();
}

class stateBlackout extends State<Blackout> {
  bool stateActivationBtn = false;

  Color blackoutColor = Colors.white;
  Color textColor=ColorsPalette[2];
  Color btnColor=ColorsPalette[4];

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
                  TweenAnimationBuilder<double>(
                      onEnd: () {
                        setState(() => stateActivationBtn = true);
                      },
                      tween: Tween(begin: 0.0, end: 1.0),
                      duration: const Duration(milliseconds: 2000),
                      curve: Curves.easeInOut,
                      builder: (context, value, child) {
                        return Stack(children: [
                          Positioned.fill(
                              child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: FractionallySizedBox(
                                      widthFactor: 1.0,
                                      heightFactor: value,
                                      child: Container(
                                          color: blackoutColor)))),
                          Image.asset(
                              'assets/backgrounds/blackout-effect.png',
                              scale: 0.35)
                        ]);
                      }),
                  AnimatedOpacity(
                      duration: Duration(milliseconds: 10),
                      opacity: stateActivationBtn ? 1 : 0,
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: stateActivationBtn
                                ? () async {
                                    replay_sound();
                                    setState(() {
                                      textColor= Colors.white;
                                      btnColor = Colors.white;
                                    });
                                    await Future.delayed(Duration(milliseconds: 300));
                                    int count = 0;
                                    setState(() => stateActivationBtn = false);
                                    Timer.periodic(
                                        Duration(milliseconds: 150),
                                        (timer) {
                                      setState(() {
                                        if (count % 2 == 0) {
                                          blackoutColor = Colors.black;
                                        } else {
                                          blackoutColor = Colors.white;
                                        }
                                      });
                                      count++;
                                      if (count >= 14) {
                                        timer.cancel();
                                        setState(() {
                                          blackoutColor = Colors.black;
                                        });
                                      }
                                    });
                                  }
                                : null,
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size(280, 40),
                                backgroundColor: stateActivationBtn
                                    ? btnColor
                                    : ColorsPalette[1],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero)),
                            child: Text('BLACKOUT',
                                style: TextStyle(
                                    color: stateActivationBtn
                                        ? textColor
                                        : ColorsPalette[1],
                                    fontFamily: 'OCR',
                                    fontWeight: FontWeight.w900,
                                    fontSize: 35))),
                      ))
                ])));
  }
}
