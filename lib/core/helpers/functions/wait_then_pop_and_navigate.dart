import 'package:flutter/material.dart';

Future<void> waitThenPopAndNavigate(BuildContext context,String? routName,
    {bool? showBackButton = false}) async {
  await Future.delayed(const Duration(seconds: 2));
  if (!context.mounted) return;
  Navigator.pop(context);
  (routName != null )?Navigator.pushReplacementNamed(context, routName, arguments: showBackButton): null;
}
