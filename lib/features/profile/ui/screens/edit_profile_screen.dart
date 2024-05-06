import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/core/helpers/constants_sizes.dart';
import 'package:space_app/core/helpers/constants_strings.dart';
import 'package:space_app/core/helpers/extenstions.dart';
import 'package:space_app/core/helpers/functions/firebase_services.dart';
import 'package:space_app/core/helpers/functions/navigate_after_splash.dart';
import 'package:space_app/core/helpers/functions/show_snack_bar.dart';
import 'package:space_app/core/routing/routes.dart';
import 'package:space_app/core/theming/assets.dart';
import 'package:space_app/core/widgets/buttons/animation_button.dart';
import 'package:space_app/core/widgets/loading_widgets/screens_loading_widget.dart';
import 'package:space_app/features/profile/logic/all_profile_cubit.dart';
import 'package:space_app/features/profile/logic/all_profile_state.dart';
import 'package:space_app/features/profile/logic/edit_profile_data/edit_profile_cubit.dart';
import 'package:space_app/features/profile/logic/edit_profile_data/edit_profile_state.dart';
import 'package:space_app/features/profile/logic/profile_cubit.dart';
import 'package:space_app/features/profile/logic/profile_state.dart';
import 'package:space_app/features/profile/ui/widgets/change_profile_image_widget.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/widgets/app_bars/inner_screens_app_bar.dart';
import '../widgets/edit_profile_text_field_widget.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

// class _EditProfileScreenState extends State<EditProfileScreen> {
//
//   @override
//   void initState() {
//     super.initState();
//     BlocProvider.of<ProfileCubit>(context).getUserProfile(context);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final cubit = BlocProvider.of<EditProfileCubit>(context);
//     return Scaffold(
//       backgroundColor: AppColors.primaryBlackColor,
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.only(top: 30.0.h, right: 17.0.w, left: 17.0.w),
//           child: SingleChildScrollView(
//             child: BlocListener<EditProfileCubit, EditProfileState>(
//               listener: (context, state) {
//                 state.maybeMap(
//                   updateSuccess: (value) async {
//                     await BlocProvider.of<ProfileCubit>(context).getUserProfile(context);
//                     showSnackBar(context, value.data.toString(), AppColors.primaryMidnightGreyColor);
//                   },
//                   error: (error) => showSnackBar(context, error.error.toString()),
//                   orElse: () {},
//                 );
//               },
//               child: BlocBuilder<ProfileCubit, ProfileState>(
//                 builder: (context, state) {
//                   return state.map(
//                       initial: (_) => const SizedBox.shrink(),
//                       loading: (_) => const Center(child: ScreensLoadingWidget()),
//                       success: (success) {
//                         return Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const InnerAppBar(
//                               topText: editTextKey,
//                               bottomText: profileTextKey,
//                             ),
//                             SizedBox(height: 40.h),
//                             Center(child: ChangeProfileImageWidget(image: BlocProvider.of<ProfileCubit>(context).currentUser?.photoURL ?? AppAssets.userPlaceHolder)),
//                             SizedBox(height: 40.h),
//                             EditProfileTextFieldWidget(
//                               controller: cubit.userNameController,
//                               title: userNameTextKey,
//                               hintText: enterYourUsernameTextKey,
//                               initialValue: BlocProvider.of<ProfileCubit>(context).currentUser?.displayName ?? '',
//                               onChanged: (String value) {},
//                             ),
//                             SizedBox(height: 20.h),
//                             EditProfileTextFieldWidget(
//                               controller: cubit.userPasswordController,
//                               title: passwordTextKey,
//                               hintText: enterYourPasswordTextKey,
//                               initialValue: '',
//                               onChanged: (String value) {},
//                               obscureText: true,
//                             ),
//                             SizedBox(height: 20.h),
//                             EditProfileTextFieldWidget(
//                               controller: cubit.userEmailController,
//                               title: emailTextKey,
//                               hintText: enterYourEmailTextKey,
//                               initialValue: BlocProvider.of<ProfileCubit>(context).currentUser?.email ?? '',
//                               onChanged: (String value) {},
//                               keyboardType: TextInputType.emailAddress,
//                             ),
//                             SizedBox(height: 80.h),
//                             Container(
//                               padding: EdgeInsets.symmetric(horizontal: 20.w,),
//                               child: AnimationButton(onPress: () async {
//                                 debugPrint('---- save button pressed ----'
//                                     'userName: ${cubit.userNameController.text}'
//                                     'password: ${cubit.userPasswordController.text}'
//                                     'email: ${cubit.userEmailController.text}');
//                                 BlocProvider.of<EditProfileCubit>(context).updateProfileData(
//                                   context,
//                                   photoURL: BlocProvider.of<ProfileCubit>(context).currentUser?.photoURL ?? '',
//                                 );
//                                 BlocProvider.of<ProfileCubit>(context).getUserProfile(context);
//                               },
//                                 child: Text(
//                                   saveTextKey,
//                                   style: TextStyle(
//                                     color: AppColors.primaryBlackColor,
//                                     fontSize: 16.sp,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),),
//                             ),
//                             SizedBox(height: 60.h),
//                           ],
//                         );
//                       },
//                       error: (error) => Center(child: Text(error.error)),
//                       loggedOut: (_) => const SizedBox.shrink(),
//                   );
//                 }
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


class _EditProfileScreenState extends State<EditProfileScreen> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<AllProfileCubit>(context).getUserProfile(context);
  }

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AllProfileCubit>(context);
    return Scaffold(
      backgroundColor: AppColors.primaryBlackColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 30.0.h, right: 17.0.w, left: 17.0.w),
          child: SingleChildScrollView(
            child: BlocListener<AllProfileCubit, AllProfileState>(
              listener: (context, state) {
                state.maybeMap(
                  updateSuccessfully: (value) async {
                    await BlocProvider.of<ProfileCubit>(context).getUserProfile(context);
                    // showSnackBar(context, value.message.toString(), AppColors.primaryMidnightGreyColor);
                  },
                  error: (error) => showSnackBar(context, error.error.toString()),
                  orElse: () {},
                );
              },
              child: BlocBuilder<AllProfileCubit, AllProfileState>(
                builder: (context, state) {
                  return state.map(
                      initial: (_) => const SizedBox.shrink(),
                      loading: (_) => const Center(child: ScreensLoadingWidget()),
                      success: (success) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const InnerAppBar(
                              topText: editTextKey,
                              bottomText: profileTextKey,
                            ),
                            SizedBox(height: 40.h),
                            Center(child: ChangeProfileImageWidget(image: success.user.photoURL ?? AppAssets.userPlaceHolder)),
                            SizedBox(height: 40.h),
                            EditProfileTextFieldWidget(
                              controller: cubit.userNameController,
                              title: userNameTextKey,
                              hintText: enterYourUsernameTextKey,
                              initialValue: success.user.displayName ?? '',
                              onChanged: (String value) {},
                            ),
                            SizedBox(height: 20.h),
                            EditProfileTextFieldWidget(
                              controller: cubit.userPasswordController,
                              title: passwordTextKey,
                              hintText: enterYourPasswordTextKey,
                              initialValue: '',
                              onChanged: (String value) {},
                              obscureText: true,
                            ),
                            SizedBox(height: 20.h),
                            EditProfileTextFieldWidget(
                              controller: cubit.userEmailController,
                              title: emailTextKey,
                              hintText: enterYourEmailTextKey,
                              initialValue: success.user.email ?? '',
                              onChanged: (String value) {},
                              keyboardType: TextInputType.emailAddress,
                            ),
                            SizedBox(height: 80.h),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20.w,),
                              child: AnimationButton(onPress: () async {
                                debugPrint('---- save button pressed ----'
                                    'userName: ${cubit.userNameController.text}'
                                    'password: ${cubit.userPasswordController.text}'
                                    'email: ${cubit.userEmailController.text}');
                                await cubit.updateProfileData(
                                  context,
                                  );
                                print('================================================================');
                               //cubit.getUserProfile(context);
                              },
                                child: Text(
                                  saveTextKey,
                                  style: TextStyle(
                                    color: AppColors.primaryBlackColor,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),),
                            ),
                            SizedBox(height: 60.h),
                          ],
                        );
                      },
                      updateSuccessfully: (success) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const InnerAppBar(
                              topText: editTextKey,
                              bottomText: profileTextKey,
                            ),
                            SizedBox(height: 40.h),
                            Center(child: ChangeProfileImageWidget(image: BlocProvider.of<ProfileCubit>(context).currentUser?.photoURL ?? AppAssets.userPlaceHolder)),
                            SizedBox(height: 40.h),
                            EditProfileTextFieldWidget(
                              controller: cubit.userNameController,
                              title: userNameTextKey,
                              hintText: enterYourUsernameTextKey,
                              initialValue: BlocProvider.of<ProfileCubit>(context).currentUser?.displayName ?? '',
                              onChanged: (String value) {},
                            ),
                            SizedBox(height: 20.h),
                            EditProfileTextFieldWidget(
                              controller: cubit.userPasswordController,
                              title: passwordTextKey,
                              hintText: enterYourPasswordTextKey,
                              initialValue: '',
                              onChanged: (String value) {},
                              obscureText: true,
                            ),
                            SizedBox(height: 20.h),
                            EditProfileTextFieldWidget(
                              controller: cubit.userEmailController,
                              title: emailTextKey,
                              hintText: enterYourEmailTextKey,
                              initialValue: BlocProvider.of<ProfileCubit>(context).currentUser?.email ?? '',
                              onChanged: (String value) {},
                              keyboardType: TextInputType.emailAddress,
                            ),
                            SizedBox(height: 80.h),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20.w,),
                              child: AnimationButton(onPress: () async {
                                debugPrint('---- save button pressed ----'
                                    'userName: ${cubit.userNameController.text}'
                                    'password: ${cubit.userPasswordController.text}'
                                    'email: ${cubit.userEmailController.text}');
                                BlocProvider.of<AllProfileCubit>(context).updateProfileData(
                                  context,
                                  );
                                BlocProvider.of<AllProfileCubit>(context).getUserProfile(context);
                              },
                                child: Text(
                                  saveTextKey,
                                  style: TextStyle(
                                    color: AppColors.primaryBlackColor,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),),
                            ),
                            SizedBox(height: 60.h),
                          ],
                        );
                      },
                      error: (error) => Center(child: Text(error.error)),
                      loggedOut: (_) => const SizedBox.shrink(),
                  );
                }
              ),
            ),
          ),
        ),
      ),
    );
  }
}
