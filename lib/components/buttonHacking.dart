import 'package:flutter/material.dart';
import 'package:watchdogshack/colors_and_shapes/button_hack_shape.dart';
import 'package:watchdogshack/colors_and_shapes/colors.dart';

class ButtonHack extends StatelessWidget{
  ButtonHack({required this.image, required this.onTap, required this.isPressed});
  final String image;
  final VoidCallback onTap;
  final bool isPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          color: Colors.transparent,
          margin: EdgeInsets.symmetric(horizontal: 5),
          width: 90,
          child: CustomPaint(
            painter: backgroundButtonHack(color: isPressed?ColorsPalette[2]:ColorsPalette[0]),
            child: Center(
              child: Image.asset(image,
              width: 75,
              height: 140, fit: BoxFit.cover)
            )
          )
      )
    );
  }
}