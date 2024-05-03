import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../theming/assets.dart';
import '../../theming/colors.dart';
import '../../theming/text_styles.dart';


class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton({
    super.key,
    required this.label,
    this.isFullWidth = true, this.backgroundColor, this.labelColor,
  });

  final String label;
  final bool isFullWidth;
  final Color? backgroundColor;
  final Color? labelColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isFullWidth ? double.infinity : null,
      //padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: backgroundColor ?? AppColors.primaryWhiteColor,
      ),
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
    );
  }
}