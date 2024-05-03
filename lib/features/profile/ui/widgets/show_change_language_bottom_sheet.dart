import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/core/helpers/constants.dart';
import 'package:space_app/features/localization/logic/localization_cubit.dart';
import 'package:space_app/core/helpers/extenstions.dart';

import '../../../../core/theming/colors.dart';

void showChangeLanguageBottomSheet({required BuildContext context}) {
  showModalBottomSheet(
    context: context,
    backgroundColor: AppColors.primaryMidnightGreyColor,
    builder: (BuildContext context) {
      return const ChangeLanguageWidget();
    },
  );
}


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
            title: Text(context.translate.translate.englishTextKey, style: const TextStyle(color: AppColors.primaryWhiteColor)),
            onTap: () {
              BlocProvider.of<LocalizationCubit>(context).changeLocale(englishLocale);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(context.translate.translate.arabicTextKey, style: const TextStyle(color: AppColors.primaryWhiteColor)),
            onTap: () {
              BlocProvider.of<LocalizationCubit>(context).changeLocale(arabicLocale);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
