import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:space_app/core/widgets/custom_text_form_field.dart';
import 'package:space_app/generated/l10n.dart';
import '../../../../../core/theming/assets.dart';

class UserDataSection extends StatefulWidget {
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
  State<UserDataSection> createState() => _UserDataSectionState();
}

class _UserDataSectionState extends State<UserDataSection> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100.h,
        ),
        widget.isLogin
            ? const SizedBox()
            : CustomTextFormField(
                controller: widget.nameController,
                keyboardType: TextInputType.name,
                hintText: S.of(context).yourNameTextKey,
                suffixIcon: SvgPicture.asset(
                  AppAssets.personIcon,
                  height: 5,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return S.of(context).yourNameIsRequiredTextKey;
                  }
                  return null;
                },
              ),
        SizedBox(
          height: 20.h,
        ),
        CustomTextFormField(
          controller: widget.emailController,
          hintText: widget.isLogin ? S.of(context).emailAddressTextKey : S.of(context).emailTextKey,
          keyboardType: TextInputType.emailAddress,
          suffixIcon: SvgPicture.asset(AppAssets.emailIcon),
          validator: (value) {
            if (value!.isEmpty) {
              return S.of(context).yourEmailIsRequiredTextKey;
            }
            return null;
          },
        ),
        SizedBox(
          height: 20.h,
        ),
        CustomTextFormField(
          controller: widget.passwordController,
          hintText: S.of(context).passwordTextKey,
          keyboardType: TextInputType.visiblePassword,
          obscureText: obscureText,
          suffixIcon: InkWell(
            child: obscureText
                ? SvgPicture.asset(AppAssets.lockIcon)
                : const Icon(
                    Icons.lock_open_outlined,
                    color: Colors.white,
                    size: 26,
                  ),
            onTap: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return S.of(context).yourPasswordIsRequiredTextKey;
            }
            return null;
          },
        ),
        SizedBox(
          height: 64.h,
        ),
      ],
    );
  }
}
