import 'package:flutter/material.dart';
import 'package:stock_cala/settings/setting_page.dart';

import 'home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  void toggleTheme(bool value) {
    setState(() {
      isDarkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: ScreenHome(),
      // home: SettingPage(
      //   isDarkMode: isDarkMode,
      //   onThemeChanged: toggleTheme,
      // ),
    );
  }
}
