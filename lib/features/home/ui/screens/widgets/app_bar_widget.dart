import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/core/routing/routes.dart';
import 'package:space_app/core/theming/assets.dart';
import 'package:space_app/core/theming/colors.dart';
import 'package:space_app/core/theming/text_styles.dart';
import 'package:space_app/generated/l10n.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
     // height: 100.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                S.of(context).welcomeOnboardTextKey, style: AppTextStyles.fontWhite13W400,
              ),

              Text(
                S.of(context).spaceVoyagerTextKey, style: AppTextStyles.fontWhite30W500,
              ),
            ],
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.profileScreen);
            },
            child: Container(
              height: 65.h,
              width: 65.w,
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.h),
                border: Border.all(color: Theme.of(context).colorScheme.surface.withOpacity(0.2), width: 7,style: BorderStyle.solid),
                image: DecorationImage(fit: BoxFit.fill,
                  image: AssetImage(AppAssets.ellipseImage,),
                )
              ),
            ),
          )
        ],
      ),
    );
  }
}
