import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/constants_strings.dart';
import '../../../../core/theming/colors.dart';

class ChangeLanguageWidget extends StatelessWidget {
  const ChangeLanguageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: const Text(englishTextKey, style: TextStyle(color: AppColors.primaryWhiteColor)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text(arabicTextKey, style: TextStyle(color: AppColors.primaryWhiteColor)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
