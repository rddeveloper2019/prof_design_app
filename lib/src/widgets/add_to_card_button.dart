import 'package:flutter/material.dart';
import 'package:prof_design_app/src/widgets/custom_button.dart';
import 'package:prof_design_app/src/widgets/price.dart';
import 'package:prof_design_app/src/pages/shoes_desc_page.dart';

class AddToCartBox extends StatelessWidget {
  final double price;
  const AddToCartBox({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return const ShoesDescPage();
              },
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(
            padding: const EdgeInsets.all(20),
            height: 80,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.withAlpha(225),
              borderRadius: BorderRadius.circular(100),
            ),

            child: Row(
              children: [
                Price(price: price),
                const Spacer(),
                CustomButton(
                  title: 'Add to cart',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
