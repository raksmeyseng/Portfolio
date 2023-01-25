import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio/module/app/views/app_bloc_page.dart';
import 'package:my_portfolio/simple_bloc_observer.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  // Remove # from web url
  setPathUrlStrategy();

  Bloc.observer = SimpleBlocObserver();
  runApp(
    EasyDynamicThemeWidget(
      child: const AppPage(),
    ),
  );
}
