import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/core/routing/routes.dart';
import 'package:space_app/core/theming/colors.dart';
import 'package:space_app/core/theming/text_styles.dart';
import 'package:space_app/core/widgets/custom_material_button.dart';

Future<dynamic> successRegisterShowDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: AppColors.primaryMediumGrayColor,
      actions: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 30.h),
              child: Text(
                'You registered successfully',
                style: AppTextStyles.fontBlack16W500,
              ),
            ),
            CustomMaterialButton(
              backgroundColor: AppColors.primaryLighterGreyColor,
                onPressed: () {
                  Navigator.pushNamed(context, Routes.loginScreen);
                },
                label: 'Login'),
          ],
        )
      ],
    ),
  );
}
