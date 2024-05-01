import 'package:flutter/material.dart';

enum ThemeType { light, dark }

class ThemeProvider extends ChangeNotifier {
  final ThemeData _lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color.fromRGBO(237, 215, 191, 1),
    primaryColor: const Color.fromRGBO(35, 12, 2, 1),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromRGBO(237, 215, 191, 1),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color.fromRGBO(255, 192, 157, 1), // Light mode color
    ),
    popupMenuTheme: const PopupMenuThemeData(
      color: Color.fromRGBO(255, 245, 233, 1),
    ),
    useMaterial3: true,
  );

  final ThemeData _darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color.fromRGBO(35, 12, 2, 1),
    primaryColor: const Color.fromRGBO(237, 215, 191, 1),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromRGBO(35, 12, 2, 1),
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.black, // Light mode color
    ),

    popupMenuTheme: const PopupMenuThemeData(
      color: Color.fromRGBO(104, 87, 72, 1),
    ),

    brightness: Brightness.dark, // Set brightness to dark
  );

  ThemeData _currentTheme = ThemeData(
    scaffoldBackgroundColor: const Color.fromRGBO(237, 215, 191, 1),
    primaryColor: const Color.fromRGBO(35, 12, 2, 1),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromRGBO(237, 215, 191, 1),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color.fromRGBO(255, 192, 157, 1), // Light mode color
    ),
    popupMenuTheme: const PopupMenuThemeData(
      color: Color.fromRGBO(255, 245, 233, 1),
    ),
    useMaterial3: true,
  );

  ThemeData get currentTheme => _currentTheme;

  ThemeType _currentThemeType = ThemeType.light;

  ThemeType get currentThemeType => _currentThemeType;

  void setTheme(ThemeType themeType) {
    _currentTheme = themeType == ThemeType.dark ? _darkTheme : _lightTheme;
    _currentThemeType = themeType;
    notifyListeners();
  }
}
