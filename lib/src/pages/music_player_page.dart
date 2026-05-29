import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as services;
import 'package:prof_design_app/src/helpers/helpers.dart';
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
    return const Scaffold(
      backgroundColor: Color(0xff201e28),
      body: Column(
        children: [
          Stack(
            children: [
              BackGround(),
              Padding(
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
            ],
          ),
          Expanded(
            child: Lyrics(),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}

class BackGround extends StatelessWidget {
  const BackGround({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.75, // double.infinity,

      decoration: const BoxDecoration(
        // color: Colors.transparent,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
        gradient: LinearGradient(colors: [Color(0xff33333e), Color(0xff201e28)]),
      ),
    );
  }
}

class Lyrics extends StatelessWidget {
  const Lyrics({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListWheelScrollView(
      itemExtent: 42,
      diameterRatio: 1.5,
      children: [
        ...getLyrics().map(
          (l) => Text(
            l,
            style: TextStyle(
              color: Colors.white.withAlpha(205),
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}

class MusicPlayProvider extends ChangeNotifier {}
