import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/core/helpers/constants_sizes.dart';
import 'package:space_app/core/helpers/extenstions.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';

class GiveFeedBackWidget extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;
  const GiveFeedBackWidget({super.key, required this.controller, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 4.h,
            width: 40.w,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(12)
            ),
          ),
          SizedBox(height: 12.h),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
            decoration: BoxDecoration(
              //color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(mediumBorderRadius)
            ),
            child: Column(
              children: [
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.thumb_down_off_alt_rounded, color: Theme.of(context).colorScheme.primary, size: ScreenUtil().setHeight(40),),
                    SizedBox(width: 60.w),
                    Icon(Icons.thumb_up_alt_outlined, color: Theme.of(context).colorScheme.primary, size: ScreenUtil().setHeight(40),),
                  ],
                ),
                SizedBox(height: 30.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(context.translate.translate.feedbackTextKey, style: AppTextStyles.fontWhite17W500.copyWith(color: Theme.of(context).colorScheme.primary),),
                ),
                SizedBox(height: 12.h),
                TextFormField(
                  controller: controller,
                  minLines: 4,
                  maxLines: 6,
                  style: TextStyle(color: Theme.of(context).colorScheme.primary),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
                    hintText: context.translate.translate.giveYourFeedbackTextKey,
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
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      minimumSize: Size(double.infinity, 60.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Text(
                      context.translate.translate.saveTextKey,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
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
      ),
    );
  }
}
