import 'package:flutter/material.dart';
import 'package:space_app/core/routing/routes.dart';

import '../../features/home/ui/screens/home_screen.dart';
import '../../features/not_found/not_found_screen.dart';

/// AppRouter class is responsible for generating routes for the app.
class AppRouter {
  Route generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      default:
        return MaterialPageRoute(builder: (context) => NotFoundScreen(routeSettingsName: routeSettings.name));
    }
  }
}