import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

class FixedSpinView extends StatelessWidget {
  const FixedSpinView({super.key});

  @override
  Widget build(BuildContext context) {
    final FixedSpinController c = Get.put(FixedSpinController());
    return Scaffold(
      body: Obx(
        () => Center(
          child: CustomPaint(
            painter: MyPainter(
              lineColor: const Color(0xFFDDDDDD),
              completeColor: Colors.amber,
              completePercent: 1,
              width: 10,
              arcLocation: c.arcLoc.value,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('lib/Frame.svg'),
                  const Text(
                    "% 25",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFFFC700),
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FixedSpinController extends GetxController {
  var arcLoc = 2.0.obs;
}

class MyPainter extends CustomPainter {
  Color? lineColor;
  Color? completeColor;
  double? completePercent;
  double? width;
  double? arcLocation;
  MyPainter({
    this.lineColor,
    this.completeColor,
    this.completePercent,
    this.width,
    this.arcLocation = 2,
  });
  @override
  void paint(Canvas canvas, Size size) {
    Paint line = Paint()
      ..color = lineColor!
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width!;
    Paint complete = Paint()
      ..color = completeColor!
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width!;
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 4.5, size.height / 4.5);
    canvas.drawCircle(center, radius, line);
    double arcAngle = -2 * pi * (completePercent! / 100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      pi * arcLocation! / 2,
      arcAngle,
      false,
      complete,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
