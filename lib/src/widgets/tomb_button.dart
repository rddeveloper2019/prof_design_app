import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TombButton extends StatelessWidget {
  final FaIconData icon;
  final String name;
  final Color color1;
  final Color color2;
  final void Function()? onPress;
  const TombButton({
    super.key,
    required this.icon,
    required this.name,
    required this.color1,
    required this.color2,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: FadeInLeft(
        duration: Duration(milliseconds: 250),
        child: Stack(
          children: [
            _TombButtonBackGround(icon: icon, color1: color1, color2: color2),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 140, width: 30),
                FaIcon(icon, color: Colors.white, size: 50),
                SizedBox(height: 140, width: 10),
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                FaIcon(
                  FontAwesomeIcons.chevronRight,
                  color: Colors.white,
                  size: 40,
                ),
                SizedBox(height: 140, width: 30),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _TombButtonBackGround extends StatelessWidget {
  final FaIconData icon;
  final Color color1;
  final Color color2;
  const _TombButtonBackGround({
    super.key,
    required this.icon,
    required this.color1,
    required this.color2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(125),
            offset: const Offset(4, 6),
            blurRadius: 6,
          ),
        ],
        gradient: LinearGradient(colors: [color1, color2]),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned(
              right: -20,
              top: -20,
              child: FaIcon(
                icon,
                color: Colors.white.withAlpha(100),
                size: 150,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
