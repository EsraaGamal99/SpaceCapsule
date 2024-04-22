import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/core/helpers/extenstions.dart';

import '../../theming/colors.dart';
import '../../theming/text_styles.dart';

class InnerAppBar extends StatelessWidget {
  final String topText;
  final String bottomText;

  const InnerAppBar({super.key, required this.topText, required this.bottomText});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            context.pop();
          },
          child: const Icon(Icons.arrow_back_ios_sharp, color: AppColors.primaryLightGreyColor)
        ),
        SizedBox(width: 17.0.w),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: AppColors.primaryBlackColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    topText,
                    style: AppTextStyles.fontLightGrey17W500,
                  ),
                  Text(
                    bottomText,
                    style: AppTextStyles.fontLightGrey30W700,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
