import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:watchdogshack/colors_and_shapes/colors.dart';

class Sendmsg extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => stateSendmsg();
}

class stateSendmsg extends State<Sendmsg>{
  final AudioPlayer audioPlayer = AudioPlayer();
  List<String> msgList = ['EXTORTION','BUSINESS','KILL PERSON','KILL FAMILY','LOCATION'];
  String dropDownValue = 'EXTORTION';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            color: ColorsPalette[1],
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 50,vertical: 60),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 80),
                      child: Image.asset('assets/backgrounds/send_msg.png', scale: 0.4,)),
                  DropdownButton(
                      dropdownColor: ColorsPalette[4],
                      value: dropDownValue,
                      icon: Icon(Icons.send, color: ColorsPalette[2]),
                      items: msgList
                          .map<DropdownMenuItem<String>>((String value) =>
                          DropdownMenuItem(
                              value: value,
                              child: Text(value,
                                  style: TextStyle(
                                      color: ColorsPalette[2],
                                      fontFamily: 'OCR',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 23)
                              )))
                          .toList(),
                      onChanged: (String? value) =>
                          setState(() => dropDownValue = value!)),
                  ElevatedButton(
                      onPressed: () async {
                        try {
                          await audioPlayer.stop();
                          await audioPlayer
                              .play(AssetSource('sound/hack.mp3'));
                        } catch (e) {
                          print(e);
                        }
                      },
                      child: Text('SEND MESSAGE',
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