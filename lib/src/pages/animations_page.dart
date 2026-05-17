import 'package:flutter/material.dart';
import 'package:prof_design_app/src/widgets/animated_rectangle.dart';

class AnimationsPage extends StatelessWidget {
  const AnimationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: AnimatedRectangle()));
  }
}
