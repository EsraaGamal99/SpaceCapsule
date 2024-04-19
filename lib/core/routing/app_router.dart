import 'package:flutter/material.dart';
import 'package:space_app/core/routing/routes.dart';
import 'package:space_app/features/profile/ui/screens/app_preferences_screen.dart';
import 'package:space_app/features/profile/ui/screens/edit_profile_screen.dart';
import 'package:space_app/features/profile/ui/screens/profile_screen.dart';

import '../../features/home/ui/screens/home_screen.dart';
import '../../features/not_found/not_found_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case Routes.profileScreen:
        return MaterialPageRoute(builder: (context) => const ProfileScreen());
      case Routes.editProfileScreen:
        return MaterialPageRoute(builder: (context) => EditProfileScreen());
      case Routes.appPreferencesScreen:
        return MaterialPageRoute(builder: (context) => const AppPreferencesScreen());
      default:
        return MaterialPageRoute(
            builder: (context) =>
                NotFoundScreen(routeSettingsName: routeSettings.name));
    }
  }
}