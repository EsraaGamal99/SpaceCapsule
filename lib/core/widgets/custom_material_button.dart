import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../theming/assets.dart';
import '../theming/colors.dart';
import '../theming/text_styles.dart';


class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.isFullWidth = true, this.backgroundColor, this.labelColor,
  });

  final void Function()? onPressed;
  final String label;
  final bool isFullWidth;
  final Color? backgroundColor;
  final Color? labelColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isFullWidth ? double.infinity : null,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.all(20),
          backgroundColor: backgroundColor ?? AppColors.primaryWhiteColor,
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: AppTextStyles.fontBlack21W500,
            ),
             SizedBox(width: 10.w),
            SvgPicture.asset(AppAssets.forwardArrowIcon),
          ],
        ),
      ),
    );
  }
}