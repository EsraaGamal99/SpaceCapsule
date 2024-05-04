import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:space_app/features/localization/logic/localization_cubit.dart';
import '../../theming/assets.dart';
import '../../theming/text_styles.dart';


class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton({
    super.key,
    required this.label,
    this.isFullWidth = true, this.labelColor,
  });

  final String label;
  final bool isFullWidth;
  final Color? labelColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isFullWidth ? double.infinity : null,
      //padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: AppTextStyles.fontBlack21W500.copyWith(color: Theme.of(context).primaryColor),
          ),
           SizedBox(width: 10.w),
          RotatedBox(
            quarterTurns: BlocProvider.of<LocalizationCubit>(context).isArabic() ? 2 : 0,
              child: SvgPicture.asset(AppAssets.forwardArrowIcon, color: Theme.of(context).primaryColor,)
          ),
        ],
      ),
    );
  }
}