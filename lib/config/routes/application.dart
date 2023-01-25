import 'package:flutter/material.dart';
import 'package:my_portfolio/config/routes/route_config.dart';
import 'package:my_portfolio/module/app/bloc/app_bloc.dart';
import 'package:my_portfolio/module/app/repositories/app_repository.dart';

class Application {
  static final appRepo = AppRepository();

  static final appBloc = AppBloc(appRepo: appRepo);
  static final router = RouteConfig.configureRouter();

  static BuildContext? get context {
    return router.routerDelegate.navigatorKey.currentContext;
  }
}
