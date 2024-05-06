import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/core/helpers/extenstions.dart';
import 'package:space_app/core/theming/assets.dart';
import 'package:space_app/core/theming/colors.dart';
import 'package:space_app/core/widgets/loading_widgets/screens_loading_widget.dart';
import 'package:space_app/features/profile/logic/all_profile_cubit.dart';
import 'package:space_app/features/profile/logic/all_profile_state.dart';
import 'package:space_app/features/profile/logic/profile_cubit.dart';
import 'package:space_app/features/profile/logic/profile_state.dart';

import '../../../../core/helpers/constants_strings.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/app_bars/inner_screens_app_bar.dart';
import '../widgets/setting_item_Widget.dart';
import '../widgets/user_info_widget.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

// class _ProfileScreenState extends State<ProfileScreen> {
//   TextEditingController feedbackController = TextEditingController();
//
//   void openAppPreferencesScreen(BuildContext context) => context.pushNamed(Routes.appPreferencesScreen);
//
//   @override
//   void initState() {
//     super.initState();
//     BlocProvider.of<ProfileCubit>(context).getUserProfile(context);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.primaryBlackColor,
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.only(top: 30.0.h, right: 17.0.w, left: 17.0.w),
//           child: SingleChildScrollView(
//             child: BlocConsumer<ProfileCubit, ProfileState>(
//               listener: (context, state) {
//                 state.maybeMap(
//                   loggedOut: (value) => context.pushNamed(Routes.loginScreen),
//                   orElse: () {},
//                 );
//               },
//                 builder: (context, state) {
//                   return state.map(
//                     loading: (_) => const Center(child: ScreensLoadingWidget()),
//                     error: (error) => Center(child: Text(error.error)),
//                     success: (success) {
//                       return Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const InnerAppBar(
//                             topText: appTextKey,
//                             bottomText: settingsTextKey,
//                           ),
//                           SizedBox(height: 20.h),
//                           UserInfoWidget(name: success.user.displayName ?? "", email: success.user.email ?? "", profileImage: success.user.photoURL ?? AppAssets.userPlaceHolder,),
//                           SizedBox(height: 20.h),
//                           SettingItemWidget(icon: Icons.settings, backgroundColor: AppColors.primarySoftGreyColor, foregroundColor: AppColors.primaryWhiteColor, title: appPreferencesTextKey, onTap: () => openAppPreferencesScreen(context)),
//                           SizedBox(height: 20.h),
//                           SettingItemWidget(icon: Icons.logout_rounded, backgroundColor: AppColors.primaryWhiteColor, foregroundColor: AppColors.primaryBlackColor, title: signUpTextKey, onTap: () => BlocProvider.of<ProfileCubit>(context).logout()),
//                           SizedBox(height: 50.h),
//                         ],
//                       );
//                     },
//                     initial: (_) => const SizedBox.shrink(),
//                     loggedOut: (_) => const SizedBox.shrink(),
//                   );
//                 }
//             ),
//           ),
//         ),
//       )
//     );
//   }
// }


class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController feedbackController = TextEditingController();

  void openAppPreferencesScreen(BuildContext context) => context.pushNamed(Routes.appPreferencesScreen);

  @override
  void initState() {
    super.initState();
    context.read<AllProfileCubit>().getUserProfile(context);
    // BlocProvider.of<AllProfileCubit>(context).getUserProfile(context);
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AllProfileCubit>(context).getUserProfile(context);
    return Scaffold(
      backgroundColor: AppColors.primaryBlackColor,
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
              child: BlocBuilder<AllProfileCubit, AllProfileState>(
                  builder: (context, state) {
                    return state.map(
                        loading: (_) => const Center(child: ScreensLoadingWidget()),
                        error: (error) => Center(child: Text(error.error)),
                        success: (success) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const InnerAppBar(
                                topText: appTextKey,
                                bottomText: settingsTextKey,
                              ),
                              SizedBox(height: 20.h),
                              UserInfoWidget(name: success.user.displayName ?? "", email: success.user.email ?? "", profileImage: success.user.photoURL ?? '',),
                              SizedBox(height: 20.h),
                              SettingItemWidget(icon: Icons.settings, backgroundColor: AppColors.primarySoftGreyColor, foregroundColor: AppColors.primaryWhiteColor, title: appPreferencesTextKey, onTap: () => openAppPreferencesScreen(context)),
                              SizedBox(height: 20.h),
                              SettingItemWidget(icon: Icons.logout_rounded, backgroundColor: AppColors.primaryWhiteColor, foregroundColor: AppColors.primaryBlackColor, title: signUpTextKey, onTap: () => BlocProvider.of<ProfileCubit>(context).logout()),
                              SizedBox(height: 50.h),
                            ],
                          );
                        },
                        initial: (_) => const SizedBox.shrink(),
                        loggedOut: (_) => const SizedBox.shrink(),
                        updateSuccessfully: (success) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const InnerAppBar(
                                topText: appTextKey,
                                bottomText: settingsTextKey,
                              ),
                              SizedBox(height: 20.h),
                              UserInfoWidget(name: context.read<AllProfileCubit>().currentUser?.displayName ?? "", email: context.read<AllProfileCubit>().currentUser?.email ?? "", profileImage: context.read<AllProfileCubit>().currentUser?.photoURL ?? '',),
                              SizedBox(height: 20.h),
                              SettingItemWidget(icon: Icons.settings, backgroundColor: AppColors.primarySoftGreyColor, foregroundColor: AppColors.primaryWhiteColor, title: appPreferencesTextKey, onTap: () => openAppPreferencesScreen(context)),
                              SizedBox(height: 20.h),
                              SettingItemWidget(icon: Icons.logout_rounded, backgroundColor: AppColors.primaryWhiteColor, foregroundColor: AppColors.primaryBlackColor, title: signUpTextKey, onTap: () => BlocProvider.of<ProfileCubit>(context).logout()),
                              SizedBox(height: 50.h),
                            ],
                          );
                        }
                    );
                  }
              ),
            ),
          ),
        ),
      )
    );
  }
}


