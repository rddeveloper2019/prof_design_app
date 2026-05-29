import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final Color bgStrokeColor;
  final Color circleColor;
  final double percents;
  const RadialProgress({
    super.key,
    required this.percents,
    this.bgStrokeColor = Colors.grey,
    this.circleColor = Colors.red,
  });

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animatedPercents;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _setupAnimation(0, widget.percents);
    controller.forward();
  }

  void _setupAnimation(double begin, double end) {
    animatedPercents = Tween<double>(
      begin: begin,
      end: end,
    ).animate(controller);
  }

  @override
  void didUpdateWidget(covariant RadialProgress oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.percents >= 100 || widget.percents == 0) {
      animatedPercents = Tween<double>(begin: 0, end: 0).animate(controller);
      controller.value = 0.0;
      return;
    }

    if (oldWidget.percents != widget.percents) {
      controller.reset();
      _setupAnimation(oldWidget.percents, widget.percents);
      controller.forward();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return CustomPaint(
              painter: _RadialProgressPainter(
                percents: animatedPercents.value,
                bgStrokeColor: widget.bgStrokeColor,
                circleColor: widget.circleColor,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _RadialProgressPainter extends CustomPainter {
  final Color bgStrokeColor;
  final Color circleColor;
  final double percents;

  _RadialProgressPainter({
    required this.percents,
    this.bgStrokeColor = Colors.grey,
    this.circleColor = Colors.red,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final circlePaint = Paint()
      ..color = bgStrokeColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 2 - 5;

    canvas.drawCircle(center, radius, circlePaint);

    final arcPaint = Paint()
      ..color = circleColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 12;

    final arcAngle = 2 * pi * (percents / 100);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      arcAngle,
      false,
      arcPaint,
    );

    final textSpan = TextSpan(
      text: '${percents.round()}%',
      style: TextStyle(
        color: Colors.green,
        fontSize: radius / 2.5,
        fontWeight: FontWeight.bold,
      ),
    );

    final textPainter = TextPainter(
      text: textSpan,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(minWidth: 0, maxWidth: size.width);

    final textOffset = Offset(
      center.dx - textPainter.width / 2,
      center.dy - textPainter.height / 2,
    );

    textPainter.paint(canvas, textOffset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
