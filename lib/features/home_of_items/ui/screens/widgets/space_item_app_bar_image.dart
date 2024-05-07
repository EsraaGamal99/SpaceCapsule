import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/core/theming/assets.dart';
import 'package:space_app/core/theming/colors.dart';

class SpaceItemAppBarImage extends StatelessWidget {
  final String screenTitle;

  const SpaceItemAppBarImage({
    super.key, required this.screenTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            (screenTitle == 'Rockets')
                ? AppAssets.rockets
                : (screenTitle == 'Dragons')
                ? AppAssets.galaxy
                : AppAssets.insightfulImage,
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(20.h),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.h),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.primaryWhiteColor.withOpacity(0.3),
                AppColors.primaryBlackColor.withOpacity(0.7),
              ],
              stops: const [
                0.0,
                1.9
              ]),
        ),
      ),
    );
  }
}
