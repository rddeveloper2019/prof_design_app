import 'dart:math';

import 'package:flutter/material.dart';
import 'package:prof_design_app/src/widgets/radial_progress.dart';

class RadialProgressPage extends StatefulWidget {
  const RadialProgressPage({super.key});

  @override
  State<RadialProgressPage> createState() => _RadialProgressPageState();
}

class _RadialProgressPageState extends State<RadialProgressPage> {
  double percents = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Wrap(
          spacing: 2.0,
          children: [
            SizedBox(
              width: 150,
              height: 150,
              child: RadialProgress(percents: percents),
            ),
            SizedBox(
              width: 150,
              height: 150,
              child: RadialProgress(
                percents: percents,
                circleColor: Colors.green,
              ),
            ),
            SizedBox(
              width: 150,
              height: 150,
              child: RadialProgress(
                percents: percents,
                circleColor: Colors.pink,
              ),
            ),
            SizedBox(
              width: 150,
              height: 150,
              child: RadialProgress(
                percents: percents,
                circleColor: Colors.blue,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            percents += Random().nextDouble() * 25;
            if (percents > 100) {
              percents = 0;
            }
          });
        },
        backgroundColor: Colors.red,
        child: const Icon(Icons.refresh, color: Colors.white),
      ),
    );
  }
}
