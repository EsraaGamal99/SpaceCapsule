import 'package:flutter/material.dart';
import 'package:space_app/core/helpers/extenstions.dart';
import 'package:space_app/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'space_item_app_bar_image.dart';
import 'space_item_app_bar_name.dart';


class SpaceItemsAppBar extends StatelessWidget {
  final String screenTitle;

  const SpaceItemsAppBar({super.key, required this.screenTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370.w,
      height: 196.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.h),
      ),
      child: Stack(
        children: [
          SpaceItemAppBarImage(screenTitle: screenTitle,),
          Positioned(
            bottom: 15.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_outlined,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      context.translate.translate.adventurerTextKey,
                      style: AppTextStyles.fontWhite15W500,
                    ),
                    SpaceItemAppBarName(screenTitle: screenTitle,),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
