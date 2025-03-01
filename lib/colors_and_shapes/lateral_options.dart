import 'package:flutter/material.dart';

class LateralOption extends CustomPainter {
  LateralOption({required this.color});
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(-30, 0);
    path.lineTo(size.width+30, 0);
    path.lineTo(size.width+30, size.height);
    path.lineTo(-30, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}