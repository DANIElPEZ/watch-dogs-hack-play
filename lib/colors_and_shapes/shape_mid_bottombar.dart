import 'package:flutter/material.dart';

class TriangleMidOption extends CustomPainter {
  TriangleMidOption({required this.color});
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(-15, -15);
    path.lineTo(size.width+15, -15);
    path.lineTo(size.width+45, size.height+30);
    path.lineTo(-45, size.height+30);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}