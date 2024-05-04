import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/core/helpers/constants_sizes.dart';
import 'package:space_app/core/helpers/constants_strings.dart';
import 'package:space_app/core/helpers/functions/firebase_services.dart';
import 'package:space_app/core/helpers/functions/navigate_after_splash.dart';
import 'package:space_app/core/theming/assets.dart';
import 'package:space_app/core/widgets/loading_widgets/screens_loading_widget.dart';
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

class _EditProfileScreenState extends State<EditProfileScreen> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProfileCubit>(context).getUserProfile(context);
  }

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<EditProfileCubit>(context);
    return Scaffold(
      backgroundColor: AppColors.primaryBlackColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 30.0.h, right: 17.0.w, left: 17.0.w),
          child: SingleChildScrollView(
            child: BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                if(state is Success) {
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
                        initialValue: BlocProvider.of<ProfileCubit>(context).currentUser?.email ?? '',
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
                      Center(
                        child: ElevatedButton(
                          onPressed: () async {
                            debugPrint('---- save button pressed ----'
                                'userName: ${cubit.userNameController.text}'
                                'password: ${cubit.userPasswordController.text}'
                                'email: ${cubit.userEmailController.text}');
                            BlocProvider.of<EditProfileCubit>(context).updateProfileData(
                              context,
                              photoURL: BlocProvider.of<ProfileCubit>(context).currentUser?.photoURL ?? '',
                            );
                            BlocProvider.of<ProfileCubit>(context).getUserProfile(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryWhiteColor,
                            minimumSize: Size(double.infinity, 60.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(mediumBorderRadius),
                            ),
                          ),
                          child: Text(
                            saveTextKey,
                            style: TextStyle(
                              color: AppColors.primaryBlackColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                } else if (state is ProfileLoading) {
                  return const ScreensLoadingWidget();
                } else {
                  return const SizedBox.shrink();
                }
              }
            ),
          ),
        ),
      ),
    );
  }
}
