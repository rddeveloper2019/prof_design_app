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
      backgroundColor: Color(0xff1da1f2),
      appBar: AppBar(
        backgroundColor: Color(0xff1da1f2),
        foregroundColor: Colors.white,
        title: Text('TwitterPage'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        onPressed: () {
          setState(() {
            animate = !animate;
          });
        },
        child: FaIcon(FontAwesomeIcons.play),
      ),
      body: Center(
        child: ZoomOut(
          animate: animate,
          delay: Duration(milliseconds: 500),
          from: 20,
          child: FaIcon(FontAwesomeIcons.twitter, color: Colors.white, size: 40),
        ),
      ),
    );
  }
}
