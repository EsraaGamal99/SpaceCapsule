import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../theming/assets.dart';

class ScreensLoadingWidget extends StatelessWidget {
  const ScreensLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(AppAssets.screensLoading),
    );
  }
}
