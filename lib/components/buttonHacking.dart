import 'package:flutter/material.dart';
import 'package:watchdogshack/colors_and_shapes/button_hack_shape.dart';
import 'package:watchdogshack/colors_and_shapes/colors.dart';
import 'package:audioplayers/audioplayers.dart';

class ButtonHack extends StatefulWidget{
  ButtonHack({required this.image});
  final String image;

  @override
  State<ButtonHack> createState() => _ButtonHackState();
}

class _ButtonHackState extends State<ButtonHack> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.transparent,
        margin: EdgeInsets.symmetric(horizontal: 5),
        width: 90,
        child: CustomPaint(
          painter: backgroundButtonHack(color: ColorsPalette[0]),
          child: Center(
            child: Image.asset(widget.image,
            width: 75,
            height: 140, fit: BoxFit.cover)
          )
        )
    );
  }
}