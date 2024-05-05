import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/core/helpers/constants_sizes.dart';
import '../../../../core/theming/colors.dart';

class EditProfileTextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final String hintText;
  final String initialValue;
  final Function(String) onChanged;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextInputType keyboardType;
  const EditProfileTextFieldWidget({super.key, required this.title, required this.hintText, required this.initialValue, required this.onChanged, this.validator, this.obscureText = false, this.keyboardType = TextInputType.text, required this.controller});

  @override
  State<EditProfileTextFieldWidget> createState() => _EditProfileTextFieldWidgetState();
}

class _EditProfileTextFieldWidgetState extends State<EditProfileTextFieldWidget> {

  @override
  void initState() {
    super.initState();
    debugPrint('widget.initialValue ${widget.initialValue}');
    if(widget.obscureText == false) {
      widget.controller.text = widget.initialValue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primarySoftGreyColor,
        borderRadius: BorderRadius.circular(mediumBorderRadius),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title, style: const TextStyle(color: AppColors.primarySmokeyGreyColor)),
          TextFormField(
            controller: widget.controller,
            style: const TextStyle(color: AppColors.primaryWhiteColor),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              hintText: widget.hintText,
              hintStyle: const TextStyle(color: AppColors.primarySmokeyGreyColor),
              border: InputBorder.none,
            ),
            onChanged: widget.onChanged,
            validator: widget.validator ??  (String? value) => null,
            obscureText: widget.obscureText,
            keyboardType: widget.keyboardType,
          ),
        ],
      ),
    );
  }
}
