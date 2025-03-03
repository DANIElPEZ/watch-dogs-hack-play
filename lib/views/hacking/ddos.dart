import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:watchdogshack/colors_and_shapes/colors.dart';

class DDOS extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => stateDDOS();
}

class stateDDOS extends State<DDOS>{
  final AudioPlayer audioPlayer = AudioPlayer();
  bool state_ddos=false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(preferredSize: Size.fromHeight(25), child: Container(
          color: ColorsPalette[2],
        )),
        body: Container(
            color: ColorsPalette[1],
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 50,vertical: 60),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Image.asset('assets/backgrounds/hack_wifi.png', scale: 0.5)),
                  ElevatedButton(
                      onPressed: () async {
                        try {
                          await audioPlayer
                              .play(AssetSource('sound/hack.mp3'));
                        } catch (e) {
                          print(e);
                        }
                        setState(()=>state_ddos=!state_ddos);
                      },
                      child: Text(state_ddos?'UNACTIVATE':'ACTIVATE',
                          style: TextStyle(
                              color: ColorsPalette[2],
                              fontFamily: 'OCR',
                              fontWeight: FontWeight.w900,
                              fontSize: 30)),
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: ColorsPalette[4],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero)))
                ]
            ))
      ),
    );
  }
}