import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MusicPlayerAppBar extends StatelessWidget {
  const MusicPlayerAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: FaIcon(
                FontAwesomeIcons.chevronLeft,
                color: Colors.white.withAlpha(205),
              ),
            ),
            const Spacer(),
            FaIcon(
              FontAwesomeIcons.message,
              color: Colors.white.withAlpha(205),
            ),
            const SizedBox(
              width: 10,
            ),
            FaIcon(
              FontAwesomeIcons.headphones,
              color: Colors.white.withAlpha(205),
            ),
            const SizedBox(
              width: 10,
            ),
            FaIcon(
              FontAwesomeIcons.upRightFromSquare,
              color: Colors.white.withAlpha(205),
            ),
          ],
        ),
      ),
    );
  }
}
