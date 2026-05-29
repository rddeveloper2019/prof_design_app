import 'package:flutter/material.dart';
import 'package:prof_design_app/src/models/layout_model.dart';

import 'package:prof_design_app/src/pages/launcher_page.dart';
import 'package:prof_design_app/src/pages/launcher_tablet_page.dart';
import 'package:prof_design_app/src/pages/music_player_page.dart';
import 'package:prof_design_app/src/theme/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => LayoutModel(),
      child: ChangeNotifierProvider(
        create: (_) => ThemeChanger(),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final layoutModel = Provider.of<LayoutModel>(context);
    final appTheme = Provider.of<ThemeChanger>(context);

    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'Professional Designs App',
    //   theme: appTheme.currentTheme,
    //   home: OrientationBuilder(
    //     builder: (BuildContext context, Orientation orientation) {
    //       final isTablet =
    //           orientation == Orientation.portrait &&
    //           MediaQuery.of(context).size.width > 700;
    //       layoutModel.isTablet = isTablet;
    //       if (isTablet) {
    //         return const LauncherTabletPage();
    //       }
    //       return const LauncherPage();
    //     },
    //   ),
    // );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Professional Designs App',
      theme: appTheme.currentTheme,
      home: MusicPlayerPage(),
    );
  }
}
