import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:space_app/core/helpers/extenstions.dart';

import '../../../../core/helpers/constants_strings.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/assets.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgets/buttons/animation_button.dart';
import '../../../../core/widgets/buttons/custom_material_button.dart';
import '../../data/onboarding_data_model.dart';
import '../widgets/dots_onboarding_button.dart';

class SecondOnBoardingScreen extends StatefulWidget {
  const SecondOnBoardingScreen({super.key});

  @override
  State<SecondOnBoardingScreen> createState() => _MiddleOnBoardingScreenState();
}

class _MiddleOnBoardingScreenState extends State<SecondOnBoardingScreen> {

  int onBoardingScreenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          onPageChanged: (index) {
            print('onBoardingScreenIndex $onBoardingScreenIndex  index $index  onBoardingData.length  ${onBoardingData.length}');
            setState(() {
              onBoardingScreenIndex = index;
            });
          },
          itemCount: onBoardingData.length,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                SizedBox(
                  height: MediaQueryHelper(context).height,
                  width: MediaQueryHelper(context).width,
                  child: Image.asset(
                    onBoardingData[index].image,
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
                // if(onBoardingScreenIndex != onBoardingData.length - 2 || onBoardingScreenIndex != onBoardingData.length - 1)
                  Positioned(
                    top: 60,
                    right: 20,
                    child: InkWell(
                      onTap: () {
                        context.pushNamed(Routes.welcomeScreen);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.primaryLightGreyColor.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            Text(
                              skipTextKey,
                              style: AppTextStyles.fontWhite22W600,
                            ),
                            SizedBox(width: 10.w),
                            SvgPicture.asset(AppAssets.forwardArrowIcon, colorFilter: const ColorFilter.mode(AppColors.primaryWhiteColor, BlendMode.srcIn),),
                          ],
                        ),
                      ),
                    ),
                  ),
                Positioned(
                  top: 120,
                  left: 20,
                  right: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        onBoardingData[index].title,
                        style: AppTextStyles.fontWhite63W600.copyWith(height: 1.h),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                  child: Column(
                    children: [
                      Expanded(child: Container()),
                      SizedBox(height: 20.h),
                      Text(onBoardingData[index].description,
                          style: AppTextStyles.fontWhite17W500),
                      SizedBox(height: 30.h),
                      onBoardingScreenIndex != onBoardingData.length - 1
                          ? OnBoardingDotsButton(
                              onBoardingScreensNumber: onBoardingData.length,
                              isActive: onBoardingScreenIndex == index,
                              onBoardingScreenIndex: onBoardingScreenIndex,
                            )
                          : Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: AnimationButton(
                                onPress: () {
                                  context.pushReplacementNamed(Routes.welcomeScreen);
                                },
                                child: CustomMaterialButton(

                                  label: startTextKey,
                                  isFullWidth: false,
                                  backgroundColor: AppColors.primaryWhiteColor,
                                  labelColor: AppColors.primaryBlackColor,
                                ),
                              ),
                            ),
                      SizedBox(height: 40.h),
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }
}