import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';

class AppPreferencesItemWidget extends StatelessWidget {
  final IconData iconData;
  final String title;
  final String subTitle;
  final Function onTap;
  const AppPreferencesItemWidget({super.key, required this.iconData, required this.title, required this.subTitle, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  iconData,
                  color: Theme.of(context).colorScheme.primary,
                  size: 35,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: AppTextStyles.fontWhite22W600.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      Text(
                        subTitle,
                        style: AppTextStyles.fontLightGrey17W500.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
