import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:space_app/core/helpers/constants_strings.dart';
import 'package:space_app/core/widgets/custom_text_form_field.dart';
import '../../../../../core/theming/assets.dart';

class UserDataSection extends StatelessWidget {
  const UserDataSection({
    super.key,
    required this.isLogin,
    this.nameController,
    required this.emailController,
    required this.passwordController,
  });

  final bool isLogin;
  final TextEditingController? nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100.h,
        ),
        isLogin
            ? const SizedBox()
            : CustomTextFormField(
                controller: nameController,
                hintText: yourNameTextKey,
                suffixIcon: SvgPicture.asset(
                  AppAssets.personIcon,
                  height: 5,
                ),
              ),
        SizedBox(
          height: 20.h,
        ),
        CustomTextFormField(
          controller: emailController,
          hintText: isLogin ? emailAddressTextKey : emailTextKey,
          suffixIcon: SvgPicture.asset(AppAssets.emailIcon),
        ),
        SizedBox(
          height: 20.h,
        ),
        CustomTextFormField(
          controller: passwordController,
          hintText: passwordTextKey,
          obscureText: true,
          suffixIcon: SvgPicture.asset(AppAssets.lockIcon),
        ),
        SizedBox(
          height: 64.h,
        ),
      ],
    );
  }
}
