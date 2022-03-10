import 'package:complex_ui/pages/base/base_page.dart';
import 'package:flutter/material.dart';

const _base = '/';
const _hot = '/hot';

class ProjectRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case _base:
        return _buildRoute(const BasePage());
      case _hot:
        return _buildRoute(BasePage(initialPageIndex: 0));

      default:
        return _buildRoute(
          Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }

  static MaterialPageRoute _buildRoute(Widget screen) {
    return MaterialPageRoute(builder: (_) => screen);
  }
}

enum Routes { hot }

enum BottomNavigationBarRoutes { hot, discover, watch, inbox, profile }

extension RoutNames on Routes {
  String get name {
    switch (this) {
      case Routes.hot:
        return _base;
    }
  }
}
