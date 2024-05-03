import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:space_app/core/helpers/constants_strings.dart';
import 'package:space_app/core/theming/assets.dart';
import 'package:space_app/core/theming/colors.dart';

import '../../../../../core/theming/text_styles.dart';

class PicksTitleWidget extends StatelessWidget {
  const PicksTitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                topPicksTextKey,
                style: AppTextStyles.fontWhite17W600.copyWith(color: Theme.of(context).colorScheme.primary),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                letsExploreOurProgramsTextKey,
                style: AppTextStyles.fontWhite13W400.copyWith(color: Theme.of(context).colorScheme.primary),
              ),
            ],
          ),
          IconButton(
              onPressed: () {},
              iconSize: 35.w,color: Theme.of(context).colorScheme.primary,
              icon: Icon(Icons.notifications_none_outlined,)),
        ],
      ),
    );
  }
}
