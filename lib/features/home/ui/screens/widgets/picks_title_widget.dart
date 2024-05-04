import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/core/theming/colors.dart';
import 'package:space_app/core/helpers/extenstions.dart';

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
              context.translate.topPicksTextKey,
              style: AppTextStyles.fontWhite17W600.copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              context.translate.letsExploreOurProgramsTextKey,
              style: AppTextStyles.fontWhite13W400.copyWith(color: Theme.of(context).colorScheme.primary),
            ),
          ],
        ),
        IconButton(
            onPressed: () {},
            iconSize: 35.w,//color: AppColors.primaryMediumGrayColor,
            color: Theme.of(context).colorScheme.primary,
            icon: const Icon(Icons.notifications_none_outlined,)),
      ],
    );
  }
}
