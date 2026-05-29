import 'package:flutter/material.dart';

class AudioPlayerModel with ChangeNotifier {
  bool _playing = false;
  Duration _songDuration = const Duration(seconds: 0);
  Duration _current = const Duration(seconds: 0);

  String get songTotalDuration => printDuration(_songDuration);
  String get currentSecond => printDuration(_current);

  double get percentage => _songDuration.inSeconds > 0 ? _current.inSeconds / _songDuration.inSeconds : 0;

  AnimationController? _controller;

  Duration get current => _current;

  set current(Duration value) {
    _current = value;
    notifyListeners();
  }

  Duration get songDuration => _songDuration;

  set songDuration(Duration value) {
    _songDuration = value;
    notifyListeners();
  }

  bool get playing => _playing;

  set playing(bool value) {
    _playing = value;
    notifyListeners();
  }

  AnimationController? get controller => _controller;

  set controller(AnimationController controller) {
    _controller = controller;
  }

  String printDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes % 60);
    String twoDigitSeconds = twoDigits(duration.inSeconds % 60);

    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
