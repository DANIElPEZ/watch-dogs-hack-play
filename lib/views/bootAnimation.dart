import 'package:flutter/material.dart';
import 'package:watchdogshack/colors_and_shapes/colors.dart';
import 'package:watchdogshack/views/home.dart';
import 'dart:async';

class bootAnimation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => stateBootAnimation();
}

class stateBootAnimation extends State<bootAnimation> {
  int currentIndex=0;
  late Timer timer;

  @override
  void initState() {
    super.initState();

    const frameDuration=Duration(milliseconds: 250);
    timer=Timer.periodic(frameDuration, (timer){
      if(currentIndex<209){
        setState(()=>currentIndex++);
        print(currentIndex);
      }else{
        timer.cancel();
        navigateMainView();
      }
    });
  }

  void navigateMainView(){
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>HomeView()));
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: ColorsPalette[1],
        child: Image.asset('assets/boot_animation/${currentIndex.toString().padLeft(3,'0')}.jpg',
        fit: BoxFit.cover),
      )
    ));
  }
}
