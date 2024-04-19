import 'package:flutter/material.dart';

import '../../../../core/theming/colors.dart';
import 'change_theme_widget.dart';

void showChangeThemeBottomSheet({required BuildContext context}) {
  showModalBottomSheet(
    context: context,
    backgroundColor: AppColors.primaryMidnightGreyColor,
    builder: (BuildContext context) {
      return const ChangeThemeWidget();
    },
  );
}
