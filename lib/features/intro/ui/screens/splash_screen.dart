import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:space_app/core/helpers/extenstions.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/assets.dart';
import '../../../../core/theming/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlackColor,
      body: Center(
        child: Lottie.asset(
          AppAssets.splashLottie,
          animate: true,
          width: 200,
          height: 200,
          onLoaded: (composition) {
            Timer(const Duration(seconds: 5),
              () {
                context.pushReplacementNamed(Routes.firstOnboardingScreen);
              },
            );
          },
        ),
      ),
    );
  }
}
