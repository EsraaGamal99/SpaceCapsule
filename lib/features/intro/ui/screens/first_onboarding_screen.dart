import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/core/helpers/constants_strings.dart';
import 'package:space_app/core/helpers/extenstions.dart';
import 'package:space_app/core/theming/colors.dart';
import 'package:space_app/core/theming/text_styles.dart';
import 'package:space_app/core/widgets/buttons/animation_button.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/assets.dart';
import '../../../../core/widgets/buttons/custom_material_button.dart';


class FirstOnBoardingScreen extends StatelessWidget {
  const FirstOnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQueryHelper(context).height,
            width: MediaQueryHelper(context).width,
            child: Image.asset(
              AppAssets.onBoarding1,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: MediaQueryHelper(context).height * 0.4,
              width: MediaQueryHelper(context).width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.3),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 80.h,
            left: 20.w,
            right: 20.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  virtualTextKey,
                  style: AppTextStyles.fontWhite40W500.copyWith(height: 1.h),
                ),
                Text(
                  galaxyTextKey,
                  style: AppTextStyles.fontWhite70W600.copyWith(height: 1.h),
                ),
                Text(
                  explorerTextKey,
                  style: AppTextStyles.fontWhite70W600.copyWith(height: 1.h),
                ),
                SizedBox(height: 20.h),
                Text(
                  weWillLearnTextKey,
                  style: AppTextStyles.fontWhite16W600,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 60.h,
            left: 30.w,
            right: 30.w,
            child: AnimationButton(
              onPress: () {
                context.pushReplacementNamed(Routes.secondOnboardingScreen);
              },
              child: CustomMaterialButton(
                label: startTextKey,
                isFullWidth: false,
                backgroundColor: AppColors.primaryWhiteColor,
                labelColor: AppColors.primaryBlackColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}