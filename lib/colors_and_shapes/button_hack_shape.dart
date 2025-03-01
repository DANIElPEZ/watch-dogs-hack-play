import 'package:flutter/material.dart';

class backgroundButtonHack extends CustomPainter {
  backgroundButtonHack({required this.color});
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(18, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height-18);
    path.lineTo(size.width-18, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 18);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}