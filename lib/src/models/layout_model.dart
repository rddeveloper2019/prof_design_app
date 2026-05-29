import 'dart:math';

import 'package:flutter/material.dart';
import 'package:prof_design_app/src/pages/slide_show_page.dart';

int random = Random().nextInt(4);

class LayoutModel with ChangeNotifier {
  Widget _currentPage = const SlideShowPage();
  bool _isTablet = false;

  void navigate(BuildContext context, Widget page) {
    random = Random().nextInt(4);
    _currentPage = page;

    if (_isTablet) {
      notifyListeners();
      return;
    }

    Navigator.of(
      context,
    ).push(createRoute(page));
  }

  bool isLarge(BuildContext context) {
    return MediaQuery.of(context).size.width > 700 && !_isTablet;
  }

  set isTablet(bool isTablet) {
    _isTablet = isTablet;
  }

  Widget get currentPage => _currentPage;
  bool get isTablet => _isTablet;

  Route createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondAnimation) => page,
      transitionDuration: const Duration(seconds: 1),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final curvedAnimation = CurvedAnimation(parent: animation, curve: Curves.linear);

        final slideTransition = SlideTransition(
          position: Tween<Offset>(begin: const Offset(-0.5, 1.0), end: Offset.zero).animate(curvedAnimation),
          child: child,
        );

        final scaleTransition = ScaleTransition(
          scale: Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation),
          child: child,
        );

        final rotationTransition = RotationTransition(
          turns: Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation),
          child: child,
        );

        final fadeTransition = FadeTransition(
          opacity: Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation),
          child: child,
        );

        final List<Widget> transitions = [slideTransition, scaleTransition, rotationTransition, fadeTransition];

        return transitions[random];
      },
    );
  }
}
