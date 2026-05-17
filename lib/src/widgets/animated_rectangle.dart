import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedRectangle extends StatefulWidget {
  const AnimatedRectangle({super.key});

  @override
  State<AnimatedRectangle> createState() => _AnimatedRectangleState();
}

class _AnimatedRectangleState extends State<AnimatedRectangle>
    with SingleTickerProviderStateMixin {
  // Animation
  late AnimationController controller;
  late Animation<double> rotation;
  late Animation<double> opacity;
  late Animation<double> fadeOut;
  late Animation<double> mover;
  late Animation<double> scale;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 4000),
    );
    rotation = Tween<double>(
      begin: 0.0,
      end: 2.0 * pi,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInCubic));

    mover = Tween<double>(
      begin: 0.0,
      end: 200,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInCubic));

    opacity = Tween<double>(begin: 0.1, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.15, 0.85, curve: Curves.easeInOut),
      ),
    );
    fadeOut = Tween<double>(begin: 0.0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.75, 1, curve: Curves.easeInOut),
      ),
    );
    scale = Tween<double>(
      begin: 0.1,
      end: 2,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));

    // controller.repeat();
    controller.forward();
    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        controller.reverse();
      }
    });
    controller.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(mover.value, 0),
          child: Transform.rotate(
            angle: rotation.value * 2,
            child: Transform.scale(
              scale: scale.value,
              child: Opacity(
                opacity: opacity.value - fadeOut.value,
                child: child,
              ),
            ),
          ),
        );
      },
      animation: rotation,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(color: Colors.green),
      ),
    );
  }
}
