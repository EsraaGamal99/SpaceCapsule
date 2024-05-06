import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/core/helpers/extenstions.dart';
import 'package:space_app/core/theming/colors.dart';
import 'package:space_app/features/profile/logic/all_profile_cubit.dart';
import 'package:space_app/features/profile/logic/all_profile_state.dart';
import 'package:space_app/generated/l10n.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/app_bars/inner_screens_app_bar.dart';
import '../widgets/setting_item_Widget.dart';
import '../widgets/user_info_widget.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController feedbackController = TextEditingController();

  void openAppPreferencesScreen(BuildContext context) => context.pushNamed(Routes.appPreferencesScreen);

  @override
  void initState() {
    super.initState();
    BlocProvider.of<AllProfileCubit>(context).getUserProfile(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 30.0.h, right: 17.0.w, left: 17.0.w),
          child: SingleChildScrollView(
            child: BlocListener<AllProfileCubit, AllProfileState>(
              listener: (context, state) {
                state.maybeMap(
                  loggedOut: (value) => context.pushNamed(Routes.loginScreen),
                  orElse: () {},
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InnerAppBar(
                    topText: context.translate.appTextKey,
                    bottomText: context.translate.settingsTextKey,
                  ),
                  SizedBox(height: 20.h),
                  UserInfoWidget(name: BlocProvider.of<AllProfileCubit>(context).currentUser?.displayName ?? 'Bryan Wolf', email: BlocProvider.of<AllProfileCubit>(context).currentUser?.email ?? 'bryanwolf@gmail.com'),
                  SizedBox(height: 20.h),
                  SettingItemWidget(icon: Icons.settings, backgroundColor: AppColors.primarySoftGreyColor, foregroundColor: AppColors.primaryWhiteColor, title: context.translate.appPreferencesTextKey, onTap: () => openAppPreferencesScreen(context)),
                  SizedBox(height: 20.h),
                  SettingItemWidget(icon: Icons.logout_rounded, backgroundColor: AppColors.primaryWhiteColor, foregroundColor: AppColors.primaryBlackColor, title: context.translate.signOutTextKey, onTap: () => BlocProvider.of<AllProfileCubit>(context).logout()),
                  SizedBox(height: 50.h),
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}


