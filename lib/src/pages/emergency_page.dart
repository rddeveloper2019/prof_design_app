import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:prof_design_app/src/datasources/tomb_buttons.dart';
import 'package:prof_design_app/src/widgets/icon_header.dart';
import 'package:prof_design_app/src/widgets/tomb_button.dart';

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 250),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: tombButtons,
            ),
          ),
          IconHeader(),
        ],
      ),
    );
  }
}
