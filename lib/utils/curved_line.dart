import 'package:flutter/material.dart';

class CurvedLine extends StatelessWidget {
  const CurvedLine({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(double.infinity, 4),
      painter: CurvedLinePainter(),
    );
  }
}

class CurvedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint glowPaint =
        Paint()
          ..color = Colors.white.withValues(alpha: 0.4)
          ..maskFilter = MaskFilter.blur(BlurStyle.normal, 8)
          ..strokeWidth = 8
          ..style = PaintingStyle.stroke;

    Paint mainPaint =
        Paint()
          ..color = Colors.white
          ..strokeWidth = 3
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round;

    Path path = Path();
    path.moveTo(0, size.height / 2);
    path.quadraticBezierTo(size.width / 2, -10, size.width, size.height / 2);

    Path glowPath = Path();
    glowPath.moveTo(0, size.height / 2 + 3);
    glowPath.quadraticBezierTo(
      size.width / 2,
      -7,
      size.width,
      size.height / 2 + 3,
    );

    canvas.drawPath(glowPath, glowPaint);

    canvas.drawPath(path, mainPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
