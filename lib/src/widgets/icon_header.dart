import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconHeader extends StatelessWidget {
  const IconHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _IconHeaderBg(),
        Positioned(
          top: -50,
          left: -50,
          child: FaIcon(
            FontAwesomeIcons.plus,
            size: 250,
            color: Colors.white.withAlpha(55),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 80, width: double.infinity),
            Text(
              'Hanz Solizitao',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white.withAlpha(180),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Asistencia Medica',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white.withAlpha(180),
              ),
            ),
            SizedBox(height: 20),
            FaIcon(FontAwesomeIcons.plus, size: 90, color: Colors.white),
          ],
        ),
      ],
    );
  }
}

class _IconHeaderBg extends StatelessWidget {
  const _IconHeaderBg();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xff526bf6), Color(0xff67acf2)],
        ),
      ),
    );
  }
}
