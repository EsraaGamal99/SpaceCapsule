import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/generated/l10n.dart';

import '../../../../core/theming/app_theme_cubit/app_theme_cubit.dart';
import '../../../../core/theming/colors.dart';

void showChangeThemeBottomSheet({required BuildContext context}) {
  showModalBottomSheet(
    context: context,
    backgroundColor: AppColors.primaryMidnightGreyColor,
    builder: (BuildContext context) {
      return const ChangeThemeWidget();
    },
  );
}

class ChangeThemeWidget extends StatelessWidget {
  const ChangeThemeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.light_mode_rounded, color: AppColors.primaryWhiteColor),
            title: Text(S.of(context).lightTextKey, style: const TextStyle(color: AppColors.primaryWhiteColor)),
            onTap: () {
              AppThemeCubit.get(context).toggleTheme(darkMode: false);
              debugPrint(AppThemeCubit.isDarkMode.toString());
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.dark_mode_rounded, color: AppColors.primaryWhiteColor),
            title: Text(S.of(context).darkTextKey, style: const TextStyle(color: AppColors.primaryWhiteColor)),
            onTap: () {
              AppThemeCubit.get(context).toggleTheme(darkMode: true);
              debugPrint(AppThemeCubit.isDarkMode.toString());
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
