import 'package:flutter/material.dart';
import 'package:prof_design_app/src/widgets/buy_now.dart';
import 'package:prof_design_app/src/widgets/colored_buttons.dart';
import 'package:prof_design_app/src/widgets/shoe_card.dart';
import 'package:prof_design_app/src/widgets/shoe_description.dart';
import 'package:flutter/services.dart' as services;

class ShoesDescPage extends StatelessWidget {
  const ShoesDescPage({super.key});

  @override
  Widget build(BuildContext context) {
    services.SystemChrome.setSystemUIOverlayStyle(
      services.SystemUiOverlayStyle.light,
    );
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ShoeCard(
              fullScreen: true,
            ),
            ShoeDescription(
              title: 'Nike Air Max 720',
              description:
                  "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
            ),
            BuyNow(),
            SizedBox(
              height: 10,
            ),
            ColoredButtons(
              colors: [
                Colors.blueGrey,
                Colors.blue,
                Colors.orange,
                Colors.green,
                Colors.red,
              ],
            ),
            SizedBox(
              height: 20,
            ),
            LikesBox(),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}

class LikesBox extends StatelessWidget {
  const LikesBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          LikeButton(
            icon: Icon(Icons.star),
          ),
          LikeButton(
            icon: Icon(Icons.add_shopping_cart),
          ),
          LikeButton(
            icon: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}

class LikeButton extends StatelessWidget {
  final Icon icon;
  const LikeButton({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        shape: BoxShape.circle,
        boxShadow: [
          const BoxShadow(
            blurRadius: 7,
            color: Colors.black54,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: IconButton(onPressed: () {}, icon: icon, iconSize: 30),
      ),
    );
  }
}
