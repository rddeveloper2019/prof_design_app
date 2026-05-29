import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:prof_design_app/src/widgets/custom_button.dart';

class ColoredButtons extends StatelessWidget {
  final List<Color> colors;
  const ColoredButtons({
    super.key,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> buttons = List.generate(
      colors.length,
      (index) => ColoredButton(
        color: colors[index],
        index: index,
      ),
    );
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Stack(
              children: [
                ...buttons.reversed,
              ],
            ),
          ),

          CustomButton(
            title: 'More more ...',
            height: 32,
            color: Colors.orange.shade200,
          ),
        ],
      ),
    );
  }
}

class ColoredButton extends StatelessWidget {
  final Color color;
  final int index;
  const ColoredButton({
    super.key,
    this.color = Colors.black,
    this.index = 0,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      duration: Duration(milliseconds: index * 100),
      delay: const Duration(milliseconds: 500),
      child: Container(
        margin: EdgeInsets.only(left: index * 35),
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      ),
    );
  }
}
