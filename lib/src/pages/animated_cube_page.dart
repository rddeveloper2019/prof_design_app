import 'package:flutter/material.dart';

class AnimatedCubePage extends StatelessWidget {
  const AnimatedCubePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: _Rectangle());
  }
}

class _Rectangle extends StatefulWidget {
  const _Rectangle();

  @override
  State<_Rectangle> createState() => __RectangleState();
}

class __RectangleState extends State<_Rectangle>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  late Animation moveRight;
  late Animation moveUp;
  late Animation moveLeft;
  late Animation moveDown;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    );

    moveRight = Tween<double>(begin: 0, end: 100).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0, 0.25, curve: Curves.easeIn),
      ),
    );

    moveUp = Tween<double>(begin: 0, end: -100).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.25, 0.5, curve: Curves.easeIn),
      ),
    );

    moveLeft = Tween<double>(begin: 0, end: -100).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.5, 0.75, curve: Curves.easeIn),
      ),
    );

    moveDown = Tween<double>(begin: 0, end: 100).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.75, 1, curve: Curves.easeIn),
      ),
    );

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      }
      if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(
          offset: Offset(
            moveRight.value + moveLeft.value,
            moveDown.value + moveUp.value,
          ),
          child: child!,
        );
      },
      child: Center(
        child: Container(
          color: Colors.red,
          child: const SizedBox(width: 100, height: 100),
        ),
      ),
    );
  }
}
