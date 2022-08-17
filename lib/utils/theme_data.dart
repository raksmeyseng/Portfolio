import 'package:flutter/material.dart';

final lightThemeData = ThemeData(
  primarySwatch: Colors.blueGrey,
  backgroundColor: Colors.white,
  primaryColor: const Color.fromARGB(255, 74, 21, 75),
  cardColor: Colors.blueGrey[50],
  primaryTextTheme: TextTheme(
    button: TextStyle(
      color: Colors.blueGrey,
      decorationColor: Colors.blueGrey[300],
    ),
    subtitle2: TextStyle(
      color: Colors.blueGrey[900],
    ),
    subtitle1: const TextStyle(
      color: Colors.black,
    ),
    headline1: TextStyle(color: Colors.blueGrey[800]),
  ),
  // bottomAppBarColor: Colors.blueGrey[900],
  bottomAppBarColor: Colors.black,
  iconTheme: IconThemeData(color: Colors.blueGrey[300]),
  brightness: Brightness.light,
);

final darkThemeData = ThemeData(
  primarySwatch: Colors.blueGrey,
  backgroundColor: const Color.fromARGB(255, 0, 4, 24),
  primaryColor: const Color.fromARGB(255, 74, 21, 75),
  cardColor: Colors.black,
  primaryTextTheme: TextTheme(
    button: TextStyle(
      color: Colors.blueGrey[200],
      decorationColor: Colors.blueGrey[50],
    ),
    subtitle2: const TextStyle(
      color: Colors.white,
    ),
    subtitle1: TextStyle(
      color: Colors.blueGrey[300],
    ),
    headline1: const TextStyle(
      color: Colors.white70,
    ),
  ),
  bottomAppBarColor: Colors.black,
  iconTheme: IconThemeData(color: Colors.blueGrey[300]),
  brightness: Brightness.dark,
);
