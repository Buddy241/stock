import 'package:flutter/material.dart';

Color forarr = Colors.white38 as Color;
Color text = Colors.white as Color;
Color text1 = Colors.black as Color;
Color appbar = Colors.blue.shade800 as Color;
Color black = Colors.black as Color;
Color card = Colors.white70;

class FontStyles {
  // Regular Poppins Style
  static TextStyle regularStyle(double fontSize, {Color color = Colors.black}) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: fontSize,
      color: color,
    );
  }

  static TextStyle regularStyle1(double fontSize,
      {Color color = Colors.white}) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: fontSize,
      color: color,
    );
  }

  // Bold Poppins Style
  static TextStyle boldStyle(double fontSize, {Color color = Colors.black}) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: color,
    );
  }

  static TextStyle boldStyle1(double fontSize, {Color color = Colors.white}) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: color,
    );
  }

  // Italic Poppins Style
  static TextStyle italicStyle(double fontSize, {Color color = Colors.white}) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: fontSize,
      fontStyle: FontStyle.italic,
      color: color,
    );
  }

  static TextStyle italicStyle2(double fontSize, {Color color = Colors.black}) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: fontSize,
      fontStyle: FontStyle.italic,
      color: color,
    );
  }
}

class ThemeModel extends ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  ThemeData get currentTheme {
    return _isDarkMode ? ThemeData.dark() : ThemeData.light();
  }
}
