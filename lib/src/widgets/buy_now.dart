import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:prof_design_app/src/widgets/custom_button.dart';
import 'package:prof_design_app/src/widgets/price.dart';

class BuyNow extends StatelessWidget {
  const BuyNow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsetsGeometry.only(top: 10, left: 30, right: 30),
      child: Row(
        children: [
          Price(
            price: 180.75,
          ),
          Spacer(),
          BounceInDown(
            delay: Duration(milliseconds: 400),
            from: 10,
            child: CustomButton(title: 'Buy now'),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
