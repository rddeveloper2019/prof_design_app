import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final double height;
  final Color color;
  final void Function()? onPressed;
  const CustomButton({
    super.key,
    required this.title,
    this.onPressed,
    this.height = 45,
    this.color = Colors.orange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: height,
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(100)),
      child: TextButton(
        onPressed: onPressed,
        child: Center(
          child: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: height / 3, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
