import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
    BuildContext context, String errorMessage,
    [Color? backgroundColor]) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(errorMessage),
      backgroundColor: backgroundColor ?? Colors.red,
    ),
  );
}