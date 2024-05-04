import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/core/helpers/extenstions.dart';
import 'package:space_app/core/theming/app_theme_cubit/app_theme_cubit.dart';
import 'package:space_app/core/theming/text_styles.dart';
import 'package:space_app/generated/l10n.dart';
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
              AppThemeCubit.isDarkMode ? AppAssets.onBoarding1:  AppAssets.onBoarding1LightMode,
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
                  context.translate.virtualTextKey,
                  style: AppTextStyles.fontWhite40W500.copyWith(height: 1.h,color: Theme.of(context).colorScheme.primary),
                ),
                Text(
                  context.translate.galaxyTextKey,
                  style: AppTextStyles.fontWhite70W600.copyWith(height: 1.h,color: Theme.of(context).colorScheme.primary),
                ),
                Text(
                  context.translate.explorerTextKey,
                  style: AppTextStyles.fontWhite70W600.copyWith(height: 1.h,color: Theme.of(context).colorScheme.primary),
                ),
                SizedBox(height: 20.h),
                Text(
                  context.translate.weWillLearnTextKey,
                  style: AppTextStyles.fontWhite16W600.copyWith(color: Theme.of(context).colorScheme.primary),
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
              label: context.translate.startTextKey,
                isFullWidth: false,
                // backgroundColor: AppColors.primaryWhiteColor,
                // labelColor: AppColors.primaryBlackColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}