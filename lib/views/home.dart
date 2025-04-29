import 'package:flutter/material.dart';
import 'package:watchdogshack/colors_and_shapes/colors.dart';
import 'package:watchdogshack/components/buttonHacking.dart';
import 'package:audioplayers/audioplayers.dart';

//import views
import 'package:watchdogshack/views/hacking/trafficLights.dart';
import 'package:watchdogshack/views/hacking/blackout.dart';
import 'package:watchdogshack/views/hacking/hack.dart';
import 'package:watchdogshack/views/hacking/ddos.dart';
import 'package:watchdogshack/views/hacking/hackCar.dart';
import 'package:watchdogshack/views/hacking/sendMsg.dart';
import 'package:watchdogshack/views/hacking/hackPhone.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeState();
}

class _HomeState extends State<HomeView> {
  final AudioPlayer audioPlayer = AudioPlayer();
  String key = 'hack lights';
  int indexView = 0;
  int? pressedButtonIndex;

  Map<String, List> optionsHackList = {
    'hack lights': ['TRAFFIC LIGHTS', 'traffic_light'],
    'bck': ['BLACKOUT', 'blackout'],
    'hack': ['SEND VIRUS', 'hack'],
    'ddos': ['DDOS', 'hack_wifi'],
    'hack car': ['HACK CAR', 'car'],
    'send msg': ['SEND MESSAGE', 'send_msg'],
    'hack phone': ['HACK PHONE', 'phone_hack']
  };

  List<Widget> views = [
    TrafficLights(),
    Blackout(),
    Virus(),
    DDOS(),
    Hackcar(),
    Sendmsg(),
    Hackphone()
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(alignment: AlignmentDirectional.center, children: [
          Image.asset('assets/backgrounds/main_background.jpg',
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width),
          Positioned(
              top: 70,
              child: Center(
                  child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => views[indexView]));
                },
                child: Stack(alignment: AlignmentDirectional.center, children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: 300,
                      child: Image.asset(
                          'assets/backgrounds/option_background.png',
                          height: 300,
                          fit: BoxFit.cover)),
                  DefaultTextStyle(
                    style: TextStyle(
                      color: ColorsPalette[2],
                      fontFamily: 'OCR',
                      fontWeight: FontWeight.w900,
                      fontSize: 30
                    ),
                    child: Text(
                      optionsHackList[key]?[0] ?? 'YOU HAVE BEEN HACKED'
                    )
                  )
                ])
              ))),
          Positioned(
              bottom: 30,
              child: Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      itemCount: optionsHackList.length,
                      scrollDirection: Axis.horizontal,
                      padding:
                          EdgeInsets.symmetric(horizontal: 13, vertical: 7),
                      itemBuilder: (context, index) {
                        var item = optionsHackList.entries.toList()[index];
                        String img = item.value[1];
                        return ButtonHack(
                            image: 'assets/menu/$img.png',
                            isPressed: pressedButtonIndex==index,
                            onTap: () async{
                              setState(() {
                                pressedButtonIndex=index;
                                key=item.key;
                                indexView=index;
                              });
                              await Future.delayed(Duration(milliseconds: 200));
                              setState(() =>pressedButtonIndex=null);
                        });
                      })))
        ]));
  }
}
