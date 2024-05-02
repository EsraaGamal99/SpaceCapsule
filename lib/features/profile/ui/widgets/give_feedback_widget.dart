import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/core/helpers/constants_sizes.dart';
import 'package:space_app/generated/l10n.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';

class GiveFeedBackWidget extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;
  const GiveFeedBackWidget({super.key, required this.controller, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          height: 4.h,
          width: 40.w,
          decoration: BoxDecoration(
              color: AppColors.primaryWhiteColor,
              borderRadius: BorderRadius.circular(12)
          ),
        ),
        SizedBox(height: 12.h),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          decoration: BoxDecoration(
            color: AppColors.primaryMidnightGreyColor,
            borderRadius: BorderRadius.circular(mediumBorderRadius)
          ),
          child: Column(
            children: [
              SizedBox(height: 30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.thumb_down_off_alt_rounded, color: AppColors.primaryWhiteColor, size: ScreenUtil().setHeight(40),),
                  SizedBox(width: 60.w),
                  Icon(Icons.thumb_up_alt_outlined, color: AppColors.primaryWhiteColor, size: ScreenUtil().setHeight(40),),
                ],
              ),
              SizedBox(height: 30.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(S.of(context).feedbackTextKey, style: AppTextStyles.fontWhite17W500,),
              ),
              SizedBox(height: 12.h),
              TextFormField(
                controller: controller,
                minLines: 4,
                maxLines: 6,
                style: const TextStyle(color: AppColors.primaryWhiteColor),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
                  hintText: S.of(context).giveYourFeedbackTextKey,
                  hintStyle: const TextStyle(color: AppColors.primarySmokeyGreyColor),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primarySmokeyGreyColor),
                  ),
                ),
                onChanged: onChanged,
              ),
              SizedBox(height: 30.h),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryWhiteColor,
                    minimumSize: Size(double.infinity, 60.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Text(
                    S.of(context).saveTextKey,
                    style: TextStyle(
                      color: AppColors.primaryBlackColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.h),
            ],
          ),
        )
      ],
    );
  }
}
