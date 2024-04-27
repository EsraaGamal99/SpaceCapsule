  import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../theming/assets.dart';

Future<dynamic> authLoadingDialog(BuildContext context) {
    return showDialog(
            context: context,
            builder: (context) => Center(
              child: Lottie.asset(AppAssets.meditationForLoading,width: 250,height: 250),
            ),
          );
  }
