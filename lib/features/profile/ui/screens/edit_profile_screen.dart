import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/core/helpers/constants_sizes.dart';
import 'package:space_app/core/helpers/constants_strings.dart';
import 'package:space_app/core/widgets/loading_widgets/screens_loading_widget.dart';
import 'package:space_app/features/profile/logic/edit_profile_data/edit_profile_cubit.dart';
import 'package:space_app/features/profile/logic/edit_profile_data/edit_profile_state.dart';
import 'package:space_app/features/profile/logic/profile_cubit.dart';
import 'package:space_app/features/profile/logic/profile_state.dart';
import 'package:space_app/features/profile/ui/widgets/change_profile_image_widget.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/widgets/app_bars/inner_screens_app_bar.dart';
import '../widgets/edit_profile_text_field_widget.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<EditProfileCubit>(context);
    final profileCubit = BlocProvider.of<ProfileCubit>(context);
    return Scaffold(
      backgroundColor: AppColors.primaryBlackColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 30.0.h, right: 17.0.w, left: 17.0.w),
          child: SingleChildScrollView(
            child: BlocBuilder<EditProfileCubit, EditProfileState>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const InnerAppBar(
                        topText: editTextKey,
                        bottomText: profileTextKey,
                      ),
                      SizedBox(height: 40.h),
                      Center(child: ChangeProfileImageWidget()),
                      SizedBox(height: 40.h),
                      EditProfileTextFieldWidget(
                        controller: cubit.userNameController,
                        title: userNameTextKey,
                        hintText: enterYourUsernameTextKey,
                        initialValue: profileCubit.currentUser?.displayName ?? '',
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
                        initialValue: profileCubit.currentUser?.email ?? '',
                        onChanged: (String value) {},
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 80.h),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<EditProfileCubit>(context).updateProfileData(
                              photoURL: profileCubit.currentUser?.photoURL ?? '',
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryWhiteColor,
                            minimumSize: Size(double.infinity, 60.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(largeBorderRadius),
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
                  // return state.maybeMap(
                  //   updateSuccess: (success) {
                  //     ;
                  //   },
                  //   loading: (_) {
                  //     return ScreensLoadingWidget();
                  //   },
                  //   orElse: () {
                  //     return const SizedBox.shrink();
                  //   },
                  // );
                }),
          ),
        ),
      ),
    );
  }
}
