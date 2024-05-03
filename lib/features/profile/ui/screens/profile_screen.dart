import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/core/helpers/extenstions.dart';
import 'package:space_app/core/theming/colors.dart';
import 'package:space_app/generated/l10n.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/app_bars/inner_screens_app_bar.dart';
import '../widgets/setting_item_Widget.dart';
import '../widgets/show_give_feedback_bottom_sheet.dart';
import '../widgets/user_info_widget.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  TextEditingController feedbackController = TextEditingController();

  void openAppPreferencesScreen(BuildContext context) => context.pushNamed(Routes.appPreferencesScreen);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 30.0.h, right: 17.0.w, left: 17.0.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InnerAppBar(
                  topText: context.translate.appTextKey,
                  bottomText: context.translate.settingsTextKey,
                ),
                SizedBox(height: 20.h),
                const UserInfoWidget(name: 'Bryan Wolf', email: 'bryanwolf@gmail.com'),
                SizedBox(height: 20.h),
                SettingItemWidget(icon: Icons.settings, backgroundColor: AppColors.primarySoftGreyColor, foregroundColor: AppColors.primaryWhiteColor, title: context.translate.appPreferencesTextKey, onTap: () => openAppPreferencesScreen(context)),
                SizedBox(height: 20.h),
                SettingItemWidget(icon: Icons.question_mark_rounded, backgroundColor: AppColors.primarySoftGreyColor, foregroundColor: AppColors.primaryWhiteColor, title: context.translate.helpAndSupportTextKey, onTap: () {},),
                SizedBox(height: 20.h),
                SettingItemWidget(icon: Icons.star_rate_rounded, backgroundColor: AppColors.primarySoftGreyColor, foregroundColor: AppColors.primaryWhiteColor, title: context.translate.giveFeedbackTextKey, onTap: () => showGiveFeedbackBottomSheet(context: context, feedbackTextController: feedbackController, onFeedbackChanged: (String feedback) {}),),
                SizedBox(height: 20.h),
                SettingItemWidget(icon: Icons.logout_rounded, backgroundColor: AppColors.primaryWhiteColor, foregroundColor: AppColors.primaryBlackColor, title: context.translate.signOutTextKey, onTap: () {},),
                SizedBox(height: 50.h),
              ],
            ),
          ),
        ),
      )
    );
  }
}


