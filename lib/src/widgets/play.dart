import 'dart:async';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:prof_design_app/src/models/audio_player_model.dart';
import 'package:provider/provider.dart';

class Play extends StatefulWidget {
  const Play({super.key});

  @override
  State<Play> createState() => _PlayState();
}

class _PlayState extends State<Play> with TickerProviderStateMixin {
  final AudioPlayer _audioPlayer = AudioPlayer();
  StreamSubscription<Duration>? _positionSub;
  StreamSubscription<Duration?>? _durationSub;
  bool isPlaying = false;
  bool _isInitialized = false;
  late AnimationController playAnimation;

  @override
  void initState() {
    super.initState();
    playAnimation = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000));
  }

  @override
  void dispose() {
    playAnimation.dispose();

    _positionSub?.cancel();
    _durationSub?.cancel();
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _initAudio() async {
    if (_isInitialized) return;

    try {
      final audioPlayerModel = Provider.of<AudioPlayerModel>(context, listen: false);

      await _audioPlayer.setAsset('assets/musics/music.mp3');

      _positionSub = _audioPlayer.positionStream.listen((position) {
        if (mounted) {
          audioPlayerModel.current = position;
        }
      });

      _durationSub = _audioPlayer.durationStream.listen((duration) {
        if (mounted && duration != null) {
          audioPlayerModel.songDuration = duration;
        }
      });

      _isInitialized = true;
    } catch (e) {
      debugPrint('❌ Error loading audio: $e');
    }
  }

  Future<void> _togglePlay() async {
    if (!_isInitialized) {
      await _initAudio();
    }

    try {
      if (_audioPlayer.playing) {
        await _audioPlayer.pause();
        playAnimation.reverse();
        isPlaying = false;
      } else {
        await _audioPlayer.play();
        playAnimation.forward();
        isPlaying = true;
      }

      if (mounted) setState(() {});
    } catch (e) {
      debugPrint('❌ Error toggling playback: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Far Away',
              style: TextStyle(
                color: Colors.white.withAlpha(200),
                fontSize: 30,
              ),
              textAlign: TextAlign.start,
            ),
            Text(
              '-Breaking Benjamin-',
              style: TextStyle(
                color: Colors.white.withAlpha(200),
                fontSize: 15,
              ),
              textAlign: TextAlign.start,
            ),
          ],
        ),
        const Spacer(),
        FloatingActionButton(
          onPressed: _togglePlay,
          backgroundColor: Colors.orange.withAlpha(200),
          shape: const CircleBorder(),
          child: AnimatedIcon(icon: AnimatedIcons.play_pause, progress: playAnimation),
        ),
      ],
    );
  }
}
