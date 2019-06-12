import 'package:flutter/material.dart';

class DefaultTheme {
  ThemeData themeData() {
    ThemeData base = ThemeData.light();
    return base.copyWith(
      primaryColor: Colors.blueGrey.shade900,
      accentColor: Colors.amber,
      buttonColor: Colors.amber,
      scaffoldBackgroundColor: Colors.blueGrey.shade900,
      textTheme: _themeText(base.textTheme),
      errorColor: Colors.red[500],
      primaryTextTheme: _themeText(base.textTheme),
      accentTextTheme: _themeText(base.textTheme),
      textSelectionColor: Colors.amber,
      textSelectionHandleColor: Colors.amber,
      hintColor: Colors.white,
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        hintStyle: TextStyle(
          color: Colors.white,
        ),
      ),
      buttonTheme: ButtonThemeData(
        height: 50.0,
      ),
    );
  }

  TextTheme _themeText(TextTheme base) {
    return base.copyWith().apply(
          bodyColor: Colors.white,
          displayColor: Colors.amber,
        );
  }
}
