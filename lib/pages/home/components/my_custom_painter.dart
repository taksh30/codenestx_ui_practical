import 'package:flutter/material.dart';

class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path();

    path.moveTo(0, 20);

    // Left edge curve
    path.quadraticBezierTo(size.width * 0.35, 0, size.width * 0.35, 0);

    // Create smooth curve for the FAB cutout
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);

    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: const Radius.circular(30), clockwise: false);

    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);

    // Right edge curve - mirroring the left curve
    path.quadraticBezierTo(size.width * 0.65, 0, size.width, 20);

    // Complete the shape
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    // Add shadow
    canvas.drawShadow(path, Colors.black, 10, true);

    // Draw the main shape
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
