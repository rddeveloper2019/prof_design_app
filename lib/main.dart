import 'package:flutter/material.dart';
import 'package:prof_design_app/src/pages/animated_cube_page.dart';
import 'package:prof_design_app/src/pages/animations_page.dart';
import 'package:prof_design_app/src/pages/emergency_page.dart';
import 'package:prof_design_app/src/pages/headers_page.dart';
import 'package:prof_design_app/src/pages/pinterest_page.dart';
import 'package:prof_design_app/src/pages/radial_progress_page.dart';
import 'package:prof_design_app/src/pages/slide_show_page.dart';
import 'package:prof_design_app/src/pages/slivers_page.dart';

import 'src/animate_do_app/animate_do_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Professional Designs App',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: AnimateDoApp(),
    );
  }
}
