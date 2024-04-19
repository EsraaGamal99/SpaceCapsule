import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/core/theming/colors.dart';

import '../../../../core/helpers/constants_strings.dart';
import '../../../../core/widgets/app_bars/inner_screens_app_bar.dart';
import '../widgets/app_prefrences_item_widget.dart';
import '../widgets/show_change_language_bottom_sheet.dart';
import '../widgets/show_change_theme_bottom_sheet.dart';


class AppPreferencesScreen extends StatelessWidget {
  const AppPreferencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryBlackColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 30.0.h, right: 17.0.w, left: 17.0.w),
                  child: const InnerAppBar(
                    topText: appTextKey,
                    bottomText: preferencesTextKey,
                  ),
                ),
                SizedBox(height: 20.h),
                AppPreferencesItemWidget(iconData: Icons.light_mode_rounded, title: themeTextKey, subTitle: darkTextKey, onTap: () => showChangeThemeBottomSheet(context: context),),
                Divider(indent: 50.w, endIndent: 50.w, color: AppColors.primarySmokeyGreyColor,),
                AppPreferencesItemWidget(iconData: Icons.language, title: languageTextKey, subTitle: englishTextKey, onTap: () => showChangeLanguageBottomSheet(context: context),),
                SizedBox(height: 25.h),
              ],
            ),
          ),
        )
    );
  }
}



