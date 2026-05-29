import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as services;
import 'package:prof_design_app/src/widgets/music_player_app_bar.dart';
import 'package:prof_design_app/src/widgets/play.dart';
import 'package:prof_design_app/src/widgets/player_intro.dart';

class MusicPlayerPage extends StatelessWidget {
  const MusicPlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    services.SystemChrome.setSystemUIOverlayStyle(
      services.SystemUiOverlayStyle.light,
    );
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            MusicPlayerAppBar(),
            SizedBox(
              height: 20,
            ),
            PlayerIntro(),
            SizedBox(
              height: 20,
            ),
            Play(),
          ],
        ),
      ),
    );
  }
}
