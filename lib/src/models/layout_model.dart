import 'package:flutter/material.dart';
import 'package:prof_design_app/src/pages/slide_show_page.dart';

class LayoutModel with ChangeNotifier {
  Widget _currentPage = const SlideShowPage();
  bool _isTablet = false;

  void navigate(BuildContext context, Widget page) {
    _currentPage = page;

    if (_isTablet) {
      notifyListeners();
      return;
    }

    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => _currentPage));
  }

  bool isLarge(BuildContext context) {
    return MediaQuery.of(context).size.width > 700 && !_isTablet;
  }

  set isTablet(bool isTablet) {
    _isTablet = isTablet;
  }

  Widget get currentPage => _currentPage;
  bool get isTablet => _isTablet;
}
