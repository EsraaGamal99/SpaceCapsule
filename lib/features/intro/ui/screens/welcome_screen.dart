import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/core/helpers/extenstions.dart';
import 'package:space_app/core/theming/colors.dart';
import 'package:space_app/core/widgets/buttons/custom_material_button.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_theme_cubit/app_theme_cubit.dart';
import '../../../../core/theming/assets.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgets/buttons/animation_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQueryHelper(context).height,
            width: MediaQueryHelper(context).width,
            child: Image.asset(
              AppThemeCubit.isDarkMode ?  AppAssets.welcomeImage :AppAssets.welcomeImageLightMode,
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
                  context.translate.letsFloatInTextKey,
                  style: AppTextStyles.fontWhite40W500.copyWith(height: 1.h,color: Theme.of(context).colorScheme.primary),
                ),
                Text(
                  context.translate.universeTextKey,
                  style: AppTextStyles.fontWhite70W600.copyWith(height: 1.h,color: Theme.of(context).colorScheme.primary),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 60.h,
            left: 30.w,
            right: 30.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.translate.welcomeTextKey,
                  style: AppTextStyles.fontWhite40W700.copyWith(color: Theme.of(context).colorScheme.primary),
                ),
                Text(
                  context.translate.unlockAUniverseTextKey,
                  style: AppTextStyles.fontWhite19W500.copyWith(height: 1.h, color: Theme.of(context).colorScheme.primary),
                ),
                SizedBox(height: 30.h),
                AnimationButton(
                  onPress: () {
                    context.pushNamed(Routes.loginScreen);
                  },
                  child: CustomMaterialButton(
                    label: context.translate.logInTextKey,
                    isFullWidth: false,
                    labelColor: AppColors.primaryBlackColor,
                  ),
                ),
                SizedBox(height: 16.h),
                GestureDetector(
                    onTap: () {
                      context.pushNamed(Routes.registerScreen);
                    },
                    child: Center(child: Text(context.translate.createNewAccountTextKey, style: AppTextStyles.fontWhite18W500.copyWith(color: Theme.of(context).colorScheme.primary, decoration: TextDecoration.underline, decorationColor: Theme.of(context).colorScheme.primary)))
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}