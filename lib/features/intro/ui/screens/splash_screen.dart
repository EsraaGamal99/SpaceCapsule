import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:space_app/core/helpers/functions/navigate_after_splash.dart';

import '../../../../core/theming/assets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,//colorScheme.background,//AppColors.primaryBlackColor,
      body: Center(
        child: Lottie.asset(
          AppAssets.splashLottie,
          animate: true,
          width: 200,
          height: 200,
          onLoaded: (composition) {
            Timer(const Duration(seconds: 5),
              () {
                navigateAfterSplash(context);
              },
            );
          },
        ),
      ),
    );
  }
}
