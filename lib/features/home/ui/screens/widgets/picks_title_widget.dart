import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/core/theming/colors.dart';
import 'package:space_app/generated/l10n.dart';

import '../../../../../core/theming/text_styles.dart';

class PicksTitleWidget extends StatelessWidget {
  const PicksTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).topPicksTextKey,
              style: AppTextStyles.fontWhite17W600,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              S.of(context).letsExploreOurProgramsTextKey,
              style: AppTextStyles.fontWhite13W400,
            ),
          ],
        ),
        IconButton(
            onPressed: () {},
            iconSize: 35.w,color: AppColors.primaryMediumGrayColor,
            icon: const Icon(Icons.notifications_none_outlined,)),
      ],
    );
  }
}
