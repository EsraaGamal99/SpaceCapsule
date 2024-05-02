import 'package:flutter/material.dart';
import 'package:space_app/core/theming/text_styles.dart';

class SpaceItemAppBarName extends StatelessWidget {
  final String screenTitle;

  const SpaceItemAppBarName({
    super.key, required this.screenTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      (screenTitle == 'Rockets')
          ? 'Rockets'
          : (screenTitle == 'Dragons')
          ? 'Dragons'
          : 'Landpods',
      style: AppTextStyles.fontWhite33W600,
    );
  }
}
