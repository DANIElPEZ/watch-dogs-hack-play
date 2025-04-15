import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:watchdogshack/colors_and_shapes/colors.dart';

class Virus extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => stateVirus();
}

class stateVirus extends State<Virus> {
  final AudioPlayer audioPlayer = AudioPlayer();
  List<String> virusList = ['TROYAN','ADWARE','SPYWARE','RANSOMWARE','KEYLOGGER','MALWARE','WORD'];
  String dropDownValue = 'TROYAN';

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
                        child: Image.asset('assets/backgrounds/hack.png',
                            scale: 0.4)),
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
                                .play(AssetSource('sound/hack_sound.mp3'));
                          } catch (e) {
                            print(e);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: ColorsPalette[4],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero)),
                        child: Text('SEND VIRUS',
                            style: TextStyle(
                                color: ColorsPalette[2],
                                fontFamily: 'OCR',
                                fontWeight: FontWeight.w900,
                                fontSize: 40)))
                  ]))),
    );
  }
}
