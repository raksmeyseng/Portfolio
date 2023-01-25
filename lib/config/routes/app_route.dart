import 'package:go_router/go_router.dart';
import 'package:my_portfolio/config/routes/route_handler.dart';

class AppRoute {
  static const String dashboard = 'dashboard';

  static final List<GoRoute> configs = [
    GoRoute(
      name: dashboard,
      path: '/',
      pageBuilder: dashboardBuilder,
    ),
  ];
}
