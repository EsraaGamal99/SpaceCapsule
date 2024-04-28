import 'package:flutter/material.dart';
import 'package:space_app/core/routing/routes.dart';
import 'package:space_app/features/authentication/ui/screens/login_screen.dart';
import 'package:space_app/features/authentication/ui/screens/register_screen.dart';
import 'package:space_app/features/intro/ui/screens/first_onboarding_screen.dart';
import 'package:space_app/features/intro/ui/screens/second_onboarding_screen.dart';
import 'package:space_app/features/profile/ui/screens/app_preferences_screen.dart';
import 'package:space_app/features/profile/ui/screens/edit_profile_screen.dart';
import 'package:space_app/features/profile/ui/screens/profile_screen.dart';

import '../../features/home/ui/screens/home_screen.dart';
import '../../features/intro/ui/screens/splash_screen.dart';
import '../../features/intro/ui/screens/welcome_screen.dart';
import '../../features/not_found/not_found_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
       case Routes.registerScreen:
        return MaterialPageRoute(builder: (context) => const RegisterScreen());
       case Routes.loginScreen:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case Routes.firstOnboardingScreen:
        return MaterialPageRoute(builder: (context) => const FirstOnBoardingScreen());
      case Routes.secondOnboardingScreen:
        return MaterialPageRoute(builder: (context) => const SecondOnBoardingScreen());
      case Routes.welcomeScreen:
        return MaterialPageRoute(builder: (context) => const WelcomeScreen());
      case Routes.profileScreen:
        return MaterialPageRoute(builder: (context) => ProfileScreen());
      case Routes.editProfileScreen:
        return MaterialPageRoute(builder: (context) => EditProfileScreen());
      case Routes.appPreferencesScreen:
        return MaterialPageRoute(builder: (context) => const AppPreferencesScreen());
      default:
        return MaterialPageRoute(
            builder: (context) => NotFoundScreen(routeSettingsName: routeSettings.name));
    }
  }
}