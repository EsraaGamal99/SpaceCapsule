import 'package:flutter/material.dart';
import 'package:space_app/core/theming/text_styles.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
    BuildContext context, String errorMessage,
    [Color? backgroundColor]) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(errorMessage, style: AppTextStyles.fontWhite13W400,),
      backgroundColor: backgroundColor ?? Colors.red,
    ),
  );
}