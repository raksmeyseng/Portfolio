import 'package:go_router/go_router.dart';
import 'package:my_portfolio/config/routes/app_route.dart';
import 'package:my_portfolio/config/routes/route_handler.dart';

class RouteConfig {
  static GoRouter configureRouter() {
    return GoRouter(
      routes: AppRoute.configs,
      errorPageBuilder: notFoundBuilder,
      redirect: (context, state) {
        if (state.subloc.isEmpty) {
          return null;
        }
        if (state.subloc != '/') {
          // Bundle the location the user is coming from into a query parameter
          return '/?from=${state.subloc}';
        }

        // Go straight to the page
        return null;
      },

      // log diagnostic info for your routes
      debugLogDiagnostics: true,
    );
  }
}
