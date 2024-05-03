import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/core/theming/app_theme_cubit/app_theme_cubit.dart';
import 'package:space_app/features/home/ui/screens/widgets/pick_card_widget.dart';

import '../../../../../core/helpers/constants.dart';
import '../../../../../core/theming/app_theme_cubit/app_theme_state.dart';

class ListPicksWidget extends StatelessWidget {
  const ListPicksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
        builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w,),
          child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return PickCardWidget(
                  cardName: cardName[index],
                  imageName: AppThemeCubit.isDarkMode
                      ? imageName[index]
                      : imageNameLightMode[index],
                  isHomeScreen: true,
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                    height: 15,
                  ),
              itemCount: 3),
        );
      }
    );
  }
}
