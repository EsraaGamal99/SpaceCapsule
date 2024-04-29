import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';

class OnBoardingDotsButton extends StatelessWidget {
  final bool isActive;
  final int onBoardingScreensNumber;
  final int onBoardingScreenIndex;

  const OnBoardingDotsButton(
      {super.key,
      required this.isActive,
      required this.onBoardingScreensNumber,
      required this.onBoardingScreenIndex,
   });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        onBoardingScreensNumber,
        (index) => Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: onBoardingScreenIndex == index ? 26.h : onBoardingScreenIndex == index + 1 || onBoardingScreenIndex == index - 1  ? 16.h : onBoardingScreenIndex == index + 2 || onBoardingScreenIndex == index - 2 ? 12.h : 6.h,
              width: onBoardingScreenIndex == index ? 26.w : onBoardingScreenIndex == index + 1 || onBoardingScreenIndex == index - 1 ? 16.w : onBoardingScreenIndex == index + 2 || onBoardingScreenIndex == index - 2 ? 12.w : 6.w,
              decoration: BoxDecoration(
                color: onBoardingScreenIndex == index ? AppColors.primaryWhiteColor : Colors.transparent,
                border: Border.all(color: onBoardingScreenIndex != index ? AppColors.primaryWhiteColor : Colors.transparent),
                shape: BoxShape.circle
              ),
            ),
            SizedBox(width: 5.w),
          ],
        ),
      ),
    );
  }
}
