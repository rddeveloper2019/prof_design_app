import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TwitterPage extends StatefulWidget {
  const TwitterPage({super.key});

  @override
  State<TwitterPage> createState() => _TwitterPageState();
}

class _TwitterPageState extends State<TwitterPage> {
  bool animate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1da1f2),
      appBar: AppBar(
        backgroundColor: const Color(0xff1da1f2),
        foregroundColor: Colors.white,
        title: const Text('TwitterPage'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        onPressed: () {
          setState(() {
            animate = !animate;
          });
        },
        child: const FaIcon(FontAwesomeIcons.play),
      ),
      body: Center(
        child: ZoomOut(
          animate: animate,
          delay: const Duration(milliseconds: 500),
          from: 20,
          child: const FaIcon(
            FontAwesomeIcons.twitter,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
    );
  }
}
