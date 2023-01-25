import 'package:flutter/material.dart';

class AppColor {
  //===============================================
  // Primary Color
  //===============================================
  static const primary = Color.fromRGBO(135, 204, 232, 1);
  static const primaryHex = '87CCE8';
  static const primaryColors = [
    primary,
    Color.fromRGBO(239, 199, 68, 1),
  ];
  static const secondary = Color.fromRGBO(239, 199, 68, 1);
  static const buttonLight = Color.fromRGBO(232, 233, 243, 1);
  static const buttonDark = Color.fromRGBO(37, 48, 63, 1);

  //===============================================
  // Descriptive Color
  //===============================================
  static const highlight = Color.fromRGBO(59, 143, 205, 1);
  static const success = Color.fromRGBO(2, 200, 132, 1);
  static const danger = Color.fromRGBO(236, 102, 102, 1);
  static const info = Colors.blue;
  static const warning = Colors.amber;
  static const active = Color.fromRGBO(2, 200, 132, 1);
  static const inactive = Color.fromRGBO(236, 102, 102, 1);

  //===============================================
  // App Color
  //===============================================
  static const black = Color.fromRGBO(27, 33, 44, 1);
  static const white = Colors.white;
  static const lightGrey = Color.fromRGBO(245, 245, 245, 1);

  //===============================================
  // Text Color
  //===============================================
  static const textLight = Color.fromRGBO(110, 110, 110, 1);
  static const textDark = Color.fromRGBO(27, 33, 44, 1);

  //===============================================
  // Screen Background
  //===============================================
  static const background = Color.fromRGBO(234, 241, 244, 1);
  static const backgroundDark = Colors.black;
  static const backgroundLight = Colors.white;

  //===============================================
  // Cursor Color
  //===============================================
  static const cursor = primary;

  //===============================================
  // Card Color
  // Light: White
  // Dark: Black 80xdfdf
  //===============================================
  static const card = Colors.white;
  static const cardDark = Color.fromRGBO(37, 48, 63, 1);

  //===============================================
  // Divider Color
  // Light: Grey
  // Dark: White 60
  //===============================================
  static const divider = Colors.grey;
  static const dividerDark = Colors.white60;

  //===============================================
  // Bottom App Bar Color
  //===============================================
  static const bottomAppBarDark = Color.fromRGBO(1, 22, 53, 1);
  static const bottomAppBarLight = Colors.white;
}
