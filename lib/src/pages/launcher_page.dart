import 'package:flutter/material.dart';
import 'package:prof_design_app/src/theme/theme.dart';
import 'package:prof_design_app/src/widgets/left_menu.dart';
import 'package:prof_design_app/src/widgets/list_options.dart';
import 'package:provider/provider.dart';

class LauncherPage extends StatefulWidget {
  const LauncherPage({super.key});

  @override
  State<LauncherPage> createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final reverseColor = appTheme.darkTheme
        ? appTheme.currentTheme.primaryColorLight
        : appTheme.currentTheme.primaryColorDark;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: reverseColor,
        backgroundColor: appTheme.currentTheme.scaffoldBackgroundColor,
        title: Text(
          'Professional Design Phone App',
          style: TextStyle(color: reverseColor),
        ),
      ),
      drawer: const Drawer(
        child: LeftMenu(),
      ),
      body: const ListOptions(),
    );
  }
}
