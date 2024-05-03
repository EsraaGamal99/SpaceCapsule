import 'package:flutter/material.dart';
import 'package:space_app/core/theming/app_theme_cubit/app_theme_cubit.dart';
import 'package:space_app/features/home/ui/screens/widgets/pick_card_widget.dart';

import '../../../../../core/helpers/constants.dart';

class ListPicksWidget extends StatelessWidget {
  const ListPicksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return PickCardWidget(
            cardName: cardName[index],
            imageName: AppThemeCubit.isDarkMode
                ? imageName[index]
                : imageNameLightMode[index],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
              height: 15,
            ),
        itemCount: 3);
  }
}
