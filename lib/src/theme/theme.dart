import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;
  ThemeData _currentTheme = ThemeData.light();

  bool get darkTheme => _darkTheme;
  bool get customTheme => _customTheme;
  ThemeData get currentTheme => _currentTheme;

  set darkTheme(bool value) {
    _customTheme = false;
    _darkTheme = value;
    _currentTheme = value == true
        ? ThemeData.dark().copyWith(colorScheme: .fromSeed(seedColor: Colors.orangeAccent))
        : ThemeData.light().copyWith(colorScheme: .fromSeed(seedColor: Colors.orangeAccent));

    notifyListeners();
  }

  set customTheme(bool value) {
    _customTheme = value;
    _darkTheme = false;
    if (value) {
      _currentTheme = ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,

        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0B7A5F),
          brightness: Brightness.light,
        ),

        scaffoldBackgroundColor: const Color(0xFFF5F8F7),

        textTheme: const TextTheme(
          displayLarge: TextStyle(color: Color(0xFF0A2420), fontWeight: FontWeight.w600),
          bodyLarge: TextStyle(color: Color(0xFF1C2E2A)),
          bodyMedium: TextStyle(color: Color(0xFF4A5D57)),
        ),

        primaryColor: const Color(0xFF0B7A5F),
        primaryColorLight: const Color(0xFF4CAF70),
        primaryColorDark: const Color(0xFF06523D),

        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF06523D),
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF0B7A5F),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          ),
        ),
      );
    } else {
      _currentTheme = ThemeData.light().copyWith(colorScheme: .fromSeed(seedColor: Colors.orangeAccent));
    }
    notifyListeners();
  }
}
