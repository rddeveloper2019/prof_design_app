import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../animate_do_app.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FadeIn(delay: Duration(milliseconds: 500), child: Text('Animate_do')),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return TwitterPage();
                  },
                ),
              );
            },
            icon: FaIcon(FontAwesomeIcons.twitter),
          ),
          SlideInLeft(
            from: 300,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return FirstPage();
                    },
                  ),
                );
              },
              icon: FaIcon(FontAwesomeIcons.arrowRight),
            ),
          ),
        ],
      ),
      floatingActionButton: ElasticInRight(
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return NavigationPage();
                },
              ),
            );
          },
          child: FaIcon(FontAwesomeIcons.play),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElasticIn(
              delay: Duration(milliseconds: 1300),
              child: FaIcon(
                FontAwesomeIcons.newspaper,
                color: Colors.blue,
                size: 50,
              ),
            ),
            FadeInDown(
              delay: Duration(milliseconds: 300),
              child: Text(
                'Title',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w200),
              ),
            ),
            FadeInDown(
              delay: Duration(milliseconds: 600),
              child: Text(
                'Description',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
              ),
            ),
            FadeInLeft(
              delay: Duration(milliseconds: 300),
              child: Container(height: 2, width: 220, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
