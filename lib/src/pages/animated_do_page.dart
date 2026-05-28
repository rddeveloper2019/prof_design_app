import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:prof_design_app/src/theme/theme.dart';
import 'package:provider/provider.dart';

class AnimateDoPage extends StatelessWidget {
  const AnimateDoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final reverseColor = appTheme.darkTheme
        ? appTheme.currentTheme.primaryColorLight
        : appTheme.currentTheme.primaryColorDark;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: reverseColor,
        backgroundColor: appTheme.currentTheme.scaffoldBackgroundColor,
        title: const FadeIn(delay: Duration(milliseconds: 500), child: Text('Animate_do')),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const FaIcon(FontAwesomeIcons.twitter),
          ),
          SlideInLeft(
            from: 300,
            child: IconButton(
              onPressed: () {},
              icon: const FaIcon(FontAwesomeIcons.arrowRight),
            ),
          ),
        ],
      ),
      floatingActionButton: ElasticInRight(
        child: FloatingActionButton(
          onPressed: () {},
          child: const FaIcon(FontAwesomeIcons.play),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ElasticIn(
              delay: Duration(milliseconds: 1300),
              child: FaIcon(
                FontAwesomeIcons.newspaper,
                color: Colors.blue,
                size: 50,
              ),
            ),
            const FadeInDown(
              delay: Duration(milliseconds: 300),
              child: Text(
                'Title',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w200),
              ),
            ),
            const FadeInDown(
              delay: Duration(milliseconds: 600),
              child: Text(
                'Description',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
              ),
            ),
            FadeInLeft(
              delay: const Duration(milliseconds: 300),
              child: Container(height: 2, width: 220, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
