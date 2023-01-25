import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/config/themes/dark_theme.dart';
import 'package:my_portfolio/config/themes/light_theme.dart';
import 'package:my_portfolio/module/app/model/app_theme_options.dart';

abstract class AppTheme extends Equatable {
  const AppTheme(this.themeOptions);
  final AppThemeOptions? themeOptions;
  ThemeData get themeData;
  Widget get icon;
  String getKey();
}

class AppThemeFactory {
  static AppTheme buildTheme(String? key, {AppThemeOptions? themeOptions}) {
    switch (key) {
      case DarkTheme.key:
        return LightTheme(themeOptions);
      case LightTheme.key:
        return DarkTheme(themeOptions);
      default:
        return DarkTheme(themeOptions);
    }
  }

  static AppTheme toggleTheme(String? key, {AppThemeOptions? themeOptions}) {
    switch (key) {
      case DarkTheme.key:
        return LightTheme(themeOptions);
      case LightTheme.key:
        return DarkTheme(themeOptions);
      default:
        return DarkTheme(themeOptions);
    }
  }
}

class DarkTheme extends AppTheme {
  static const String key = 'DarkTheme';
  const DarkTheme(AppThemeOptions? themeOptions) : super(themeOptions);

  @override
  ThemeData get themeData => darkTheme(themeOptions);

  @override
  Widget get icon => const Icon(Icons.dark_mode, key: Key('dark_mode'));

  @override
  String getKey() => key;

  @override
  List<Object?> get props => [themeData, icon, getKey()];
}

class LightTheme extends AppTheme {
  static const String key = 'LightTheme';
  const LightTheme(AppThemeOptions? themeOptions) : super(themeOptions);

  @override
  ThemeData get themeData => lightTheme(themeOptions);

  @override
  Widget get icon => const Icon(Icons.light_mode, key: Key('light_mode'));

  @override
  String getKey() => key;

  @override
  List<Object?> get props => [themeData, icon, getKey()];
}
