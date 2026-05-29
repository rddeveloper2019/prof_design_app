import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Play extends StatelessWidget {
  const Play({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Far Away',
              style: TextStyle(
                color: Colors.white.withAlpha(200),
                fontSize: 30,
              ),
              textAlign: TextAlign.start,
            ),
            Text(
              '-Breaking Benjamin-',
              style: TextStyle(
                color: Colors.white.withAlpha(200),
                fontSize: 15,
              ),
              textAlign: TextAlign.start,
            ),
          ],
        ),
        const Spacer(),
        FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.orange.withAlpha(200),
          shape: const CircleBorder(),
          child: const FaIcon(
            FontAwesomeIcons.play,
            color: Colors.white,
            size: 20,
          ),
        ),
      ],
    );
  }
}
