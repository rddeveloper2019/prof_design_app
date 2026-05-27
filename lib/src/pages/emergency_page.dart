import 'package:flutter/material.dart';
import 'package:prof_design_app/src/datasources/tomb_buttons.dart';
import 'package:prof_design_app/src/models/layout_model.dart';
import 'package:prof_design_app/src/widgets/icon_header.dart';
import 'package:provider/provider.dart';

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final layoutModel = Provider.of<LayoutModel>(context);
    final isLarge = layoutModel.isLarge(context);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: isLarge ? 0 : 250),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: tombButtons,
            ),
          ),
          if (!isLarge) IconHeader(),
        ],
      ),
    );
  }
}
