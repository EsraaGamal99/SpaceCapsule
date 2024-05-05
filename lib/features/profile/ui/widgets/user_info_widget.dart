import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/core/helpers/constants_strings.dart';
import 'package:space_app/core/helpers/extenstions.dart';
import 'package:space_app/core/theming/assets.dart';
import 'package:space_app/core/theming/colors.dart';
import 'package:space_app/core/theming/text_styles.dart';
import 'package:space_app/core/widgets/images/profile_image_widget.dart';
import 'package:space_app/features/profile/logic/profile_cubit.dart';

import '../../../../core/helpers/constants_sizes.dart';
import '../../../../core/routing/routes.dart';

class UserInfoWidget extends StatefulWidget {
  final String name;
  final String email;
  final String profileImage;
  const UserInfoWidget({super.key, required this.name, required this.email, required this.profileImage});

  @override
  State<UserInfoWidget> createState() => _UserInfoWidgetState();
}

class _UserInfoWidgetState extends State<UserInfoWidget> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProfileCubit>(context).getUserProfile(context);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 30.h),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primarySoftGreyColor,
        borderRadius: BorderRadius.circular(largeBorderRadius),
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              context.pushNamed(Routes.editProfileScreen);
            },
            child: Text(editProfileTextKey, style: AppTextStyles.fontWhite18W500)
          ),
          SizedBox(height: 10.h),
          ProfileImageWidget(userImage: widget.profileImage),
          SizedBox(height: 20.h),
          Text(widget.name, style: AppTextStyles.fontLightGrey18W600),
          SizedBox(height: 5.h),
          Container(color: AppColors.primaryLightGreyColor, width: 40.w, height: 1.h),
          SizedBox(height: 5.h),
          Text(widget.email, style: AppTextStyles.fontLightGrey18W600),
        ],
      ),
    );
  }
}
