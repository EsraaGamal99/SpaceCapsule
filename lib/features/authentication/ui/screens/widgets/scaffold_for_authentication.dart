import 'package:flutter/material.dart';
import 'package:space_app/core/theming/assets.dart';

import '../../../../../core/theming/app_theme_cubit/app_theme_cubit.dart';

class ScaffoldForAuthentication extends StatelessWidget {
  const ScaffoldForAuthentication({
    super.key, required this.body,
  });
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppThemeCubit.isDarkMode ? AppAssets.authBackground : AppAssets.authBackgroundLightMode,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          body,
        ],
      ),
    );
  }
}
