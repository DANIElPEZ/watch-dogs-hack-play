import 'package:flutter/material.dart';
import 'package:watchdogshack/colors_and_shapes/colors.dart';
import 'package:watchdogshack/components/buttonHacking.dart';
import 'package:audioplayers/audioplayers.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeState();
}

class _HomeState extends State<HomeView> {
  final AudioPlayer audioPlayer=AudioPlayer();
  String key = 'hack lights';
  int indexView=0;
  Map<String, List> optionsHackList = {
    'hack lights': ['HACK TRAFFIC LIGHTS', 'traffic_light'],
    'bck': ['BLACKOUT', 'blackout'],
    'hack': ['HACK SYSTEM', 'hack'],
    'ddos': ['DDOS', 'hack_wifi'],
    'hack car': ['HACK CAR', 'car'],
    'send msg': ['SEND MESSAGE', 'send_msg'],
    'hack phone': ['HACK PHONE', 'phone_hack']
  };

  List<Widget> views=[];

  Future<void> playSound()async{
    try {
      await audioPlayer.play(AssetSource('sound/hack.mp3'));
    }catch(e){
      print(e);
    }
  }

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
                  child:
                      Stack(alignment: AlignmentDirectional.center, children: [
                        GestureDetector(
                          onTap:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>views[indexView]));
                          },
                          child: Container(
                              width: MediaQuery.of(context).size.width * 0.85,
                              height: 300,
                              child: Image.asset(
                                  'assets/backgrounds/option_background.png',
                                  height: 300,
                                  fit: BoxFit.cover))
                        ),
                Text(optionsHackList[key]?[0] ?? 'no',
                    style: TextStyle(
                        color: ColorsPalette[2],
                        fontFamily: 'OCR',
                        fontWeight: FontWeight.w900,
                        fontSize: 30))
              ]))),
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
                        return GestureDetector(
                          behavior: HitTestBehavior.opaque,
                            onTap: () async{
                              playSound();
                              setState(() {
                                key = item.key;
                                indexView=index;
                              });
                            },
                            child:ButtonHack(image: 'assets/menu/$img.png'));
                      })))
        ]));
  }
}
