import 'package:flutter/material.dart';
import 'package:prof_design_app/src/models/layout_model.dart';
import 'package:prof_design_app/src/theme/theme.dart';
import 'package:prof_design_app/src/widgets/left_menu.dart';
import 'package:provider/provider.dart';

class LauncherTabletPage extends StatefulWidget {
  const LauncherTabletPage({super.key});

  @override
  State<LauncherTabletPage> createState() => _LauncherTabletPageState();
}

class _LauncherTabletPageState extends State<LauncherTabletPage> {
  @override
  Widget build(BuildContext context) {
    final page = Provider.of<LayoutModel>(context).currentPage;
    final appTheme = Provider.of<ThemeChanger>(context);
    final reverseColor = appTheme.darkTheme
        ? appTheme.currentTheme.primaryColorLight
        : appTheme.currentTheme.primaryColorDark;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: reverseColor,
        backgroundColor: appTheme.currentTheme.scaffoldBackgroundColor,
        title: Text(
          'Professional Design Tablet App',
          style: TextStyle(color: reverseColor),
        ),
      ),
      // drawer: MainMenu(),
      body: Row(
        children: [
          const SizedBox(
            width: 300,
            height: double.infinity,
            child: LeftMenu(),
          ),
          Container(
            width: 2,
            height: double.infinity,
            color: appTheme.currentTheme.primaryColorDark,
          ),
          Expanded(child: page),
        ],
      ),
    );
  }
}
