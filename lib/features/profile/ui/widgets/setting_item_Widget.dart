import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/core/helpers/constants_sizes.dart';
import 'package:space_app/core/theming/text_styles.dart';


class SettingItemWidget extends StatelessWidget {
  final Color backgroundColor;
  final Color foregroundColor;
  final IconData icon;
  final String title;
  final void Function() onTap;
  const SettingItemWidget({super.key,  required this.backgroundColor, required this.foregroundColor, required this.icon, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap.call,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(mediumBorderRadius),
        ),
        child: Row(
          children: [
            Icon(icon, color: foregroundColor),
            const SizedBox(width: 20),
            Text(title, style: AppTextStyles.fontWhite17W500.copyWith(color: foregroundColor)),
          ],
        ),),
    );
  }
}
