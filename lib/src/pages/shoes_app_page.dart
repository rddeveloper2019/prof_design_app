import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as services;
import 'package:prof_design_app/src/widgets/add_to_card_button.dart';
import 'package:prof_design_app/src/widgets/custom_app_bar.dart';
import 'package:prof_design_app/src/widgets/shoe_card.dart';
import 'package:prof_design_app/src/widgets/shoe_description.dart';

class ShoesAppPage extends StatelessWidget {
  const ShoesAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    services.SystemChrome.setSystemUIOverlayStyle(services.SystemUiOverlayStyle.dark);
    return const Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              CustomAppBar(text: 'For you'),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      ShoeCard(),
                      ShoeDescription(
                        title: 'Nike Air Max 720',
                        description:
                            "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                      ),
                      SizedBox(
                        height: 120,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          AddToCartBox(
            price: 180.87,
          ),
        ],
      ),
    );
  }
}
