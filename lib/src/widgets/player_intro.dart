import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:prof_design_app/src/models/audio_player_model.dart';
import 'package:provider/provider.dart';

class PlayerIntro extends StatelessWidget {
  const PlayerIntro({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [_DiscImage(), Spacer(), _ProgressBar()],
    );
  }
}

class _ProgressBar extends StatelessWidget {
  const _ProgressBar();

  @override
  Widget build(BuildContext context) {
    final audioPlayerModel = Provider.of<AudioPlayerModel>(context);

    return Column(
      children: [
        Text(
          audioPlayerModel.songTotalDuration,
          style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.normal),
          textAlign: TextAlign.start,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: 230,
                width: 5,
                decoration: BoxDecoration(color: Colors.white.withAlpha(125), borderRadius: BorderRadius.circular(10)),
              ),
              Container(
                height: 230 * audioPlayerModel.percentage,
                width: 5,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
              ),
            ],
          ),
        ),
        Text(
          audioPlayerModel.currentSecond,
          style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.normal),
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}

class _DiscImage extends StatelessWidget {
  const _DiscImage();

  @override
  Widget build(BuildContext context) {
    final audioPlayerModel = Provider.of<AudioPlayerModel>(context);
    return SpinPerfect(
      duration: const Duration(seconds: 10),
      animate: true,
      infinite: true,
      manualTrigger: true,
      controller: (controller) {
        audioPlayerModel.controller = controller;
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            colors: [
              Color(0xff484750),
              Color(0xff1e1c24),
            ],
          ),
          shape: BoxShape.circle,
        ),
        width: 250,
        height: 250,
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(200),
              child: const Image(
                image: AssetImage('assets/images/aurora.jpg'),
                fit: BoxFit.contain,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              width: 25,
              height: 25,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  colors: [
                    Color(0xff484750),
                    Color(0xff1e1c24),
                  ],
                ),
                shape: BoxShape.circle,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
