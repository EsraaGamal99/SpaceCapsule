import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/core/routing/routes.dart';
import 'package:space_app/features/authentication/ui/screens/login_screen.dart';
import 'package:space_app/features/authentication/ui/screens/register_screen.dart';
import 'package:space_app/features/dragons/logic/dragon_cubit.dart';
import 'package:space_app/features/dragons/ui/dragons%20_screen.dart';

import '../../features/home/ui/screens/home_screen.dart';
import '../../features/not_found/not_found_screen.dart';
import '../di/dependency_injection.dart';

class AppRouter {
  Route generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.dragonsScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<DragonCubit>(),
            child: const DragonsScreen(),
          ),
        );
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