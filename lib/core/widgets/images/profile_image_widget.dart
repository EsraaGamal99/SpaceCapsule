import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theming/assets.dart';
import '../../theming/colors.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.primaryMidnightGreyColor, width: 8),
      ),
      child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.primarySmokeyGreyColor, width: 5),
          ),
          child: Image.asset(AppAssets.userPlaceHolder, width: 100.w, height: 100.h)),
    );
  }
}
