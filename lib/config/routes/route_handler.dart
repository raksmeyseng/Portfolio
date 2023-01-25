import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_portfolio/module/dashboard/views/dashboard_page.dart';

extension ObjectExtension on Object? {
  dynamic getValue(String key, dynamic alt) {
    if (this == null) return alt;
    return (this as Map<String, dynamic>)[key] ?? alt;
  }
}

Page dashboardBuilder(BuildContext context, GoRouterState state) {
  return MaterialPage<void>(
    key: state.pageKey,
    child: const DashboardPage(),
  );
}

Page notFoundBuilder(BuildContext context, GoRouterState state) {
  return MaterialPage<void>(
    key: state.pageKey,
    child: const SizedBox(),
  );
}
