import 'package:flutter/material.dart';
import 'package:space_app/core/routing/routes.dart';
import 'package:space_app/features/authentication/ui/screens/login_screen.dart';
import 'package:space_app/features/authentication/ui/screens/register_screen.dart';

import '../../features/home/ui/screens/home_screen.dart';
import '../../features/not_found/not_found_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
       case Routes.registerScreen:
        return MaterialPageRoute(builder: (context) => const RegisterScreen());
       case Routes.loginScreen:
        return MaterialPageRoute(builder: (context) => const LoginScreen());

      default:
        return MaterialPageRoute(builder: (context) => NotFoundScreen(routeSettingsName: routeSettings.name));
    }
  }
}