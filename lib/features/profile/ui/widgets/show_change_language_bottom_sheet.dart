import 'package:flutter/material.dart';

import '../../../../core/theming/colors.dart';
import 'change_language_widget.dart';

void showChangeLanguageBottomSheet({required BuildContext context}) {
  showModalBottomSheet(
    context: context,
    backgroundColor: AppColors.primaryMidnightGreyColor,
    builder: (BuildContext context) {
      return const ChangeLanguageWidget();
    },
  );
}