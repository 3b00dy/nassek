// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as vmath;

class MyPainter extends CustomPainter {
  var width,height;
  MyPainter({required this.height,required this.width,});
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(
      center,
      85,
      Paint()
        ..style = PaintingStyle.stroke
        ..color = Colors.black12
        ..strokeWidth = 30,
    );
    canvas.saveLayer(
      Rect.fromCenter(center: center, width: size.width*0.2, height: size.height*0.2),
      // Paint()..blendMode = BlendMode.dstIn,
      Paint(),
    );
    canvas.drawArc(
      Rect.fromCenter(center: center, width: size.width*0.2, height: size.height*0.2),
      vmath.radians(0),
      vmath.radians(150),
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..color = Colors.green
        ..strokeWidth = 20,
    );

    canvas.drawArc(
      Rect.fromCenter(center: center, width: 155, height: 155),
      vmath.radians(0),
      vmath.radians(360),
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..color = Colors.green
        ..strokeWidth = 15
        ..blendMode = BlendMode.srcIn,
    );
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}