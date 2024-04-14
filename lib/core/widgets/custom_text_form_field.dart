import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/core/theming/colors.dart';
import '../theming/text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextAlign textAlign;
  final double? width;
  final double? height;
  final String? hintText;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool? readOnly;
  final String? labelText;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? errorText;

  const CustomTextFormField({
    super.key,
    this.keyboardType,
    this.inputFormatters,
    this.height,
    this.width,
    this.hintText,
    this.textAlign = TextAlign.start,
    this.onChanged,
    this.onFieldSubmitted,
    this.controller,
    this.validator,
    this.readOnly,
    this.labelText,
    this.obscureText = false,
    this.suffixIcon,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly ?? false,
      obscureText: obscureText,
      style: AppTextStyles.fontWhite17W500,
      textInputAction: TextInputAction.next,
      validator: validator,
      controller: controller,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      cursorHeight: 20,
      cursorColor: AppColors.primaryWhiteColor,
      decoration: InputDecoration(
        errorText: errorText,
        suffixIcon: suffixIcon,
        suffixIconConstraints: const BoxConstraints.tightFor(
          width: 24, // Set the width of the suffix icon
          height: 26, // Set the height of the suffix icon
        ),
        isDense: true,
        hintText: hintText,
        labelText: labelText,
        labelStyle: AppTextStyles.fontWhite17W500,
        hintStyle: AppTextStyles.fontWhite17W500,
        contentPadding:
             EdgeInsets.symmetric(vertical: 16.h),
        filled: true,
        fillColor: Colors.transparent,
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryWhiteColor, width: 1.0),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryWhiteColor, width: 1.0),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryWhiteColor, width: 3.0),
        ),
        focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryWhiteColor, width: 2.0),
        ),
      ),
    );
  }
}