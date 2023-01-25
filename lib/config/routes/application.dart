import 'package:flutter/material.dart';
import 'package:my_portfolio/config/routes/route_config.dart';

class Application {
  static final router = RouteConfig.configureRouter();

  static BuildContext? get context {
    return router.routerDelegate.navigatorKey.currentContext;
  }
}
