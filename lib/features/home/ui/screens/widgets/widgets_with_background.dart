import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/features/home/ui/screens/widgets/search_text_field_widget.dart';

import '../../../../../core/theming/app_theme_cubit/app_theme_cubit.dart';
import '../../../../../core/theming/app_theme_cubit/app_theme_state.dart';
import '../../../../../core/theming/assets.dart';
import 'app_bar_widget.dart';
import 'picks_title_widget.dart';

class BackgroundWidgets extends StatelessWidget {
  const BackgroundWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
        builder: (context, state) {
        return Center(
          child: Container(
            height: 320.h,
            padding: EdgeInsets.only(right: 30.w,left: 30.w,top: 70.h),
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppThemeCubit.isDarkMode ? AppAssets.homeBackgroundImage: AppAssets.homeBackgroundLightModeImage,),
                  fit: BoxFit.cover,
                )
            ),

            child: Column(
              children: [
                AppBarWidget(),
                SizedBox(height: 30,),
                SearchTextFieldWidget(),
                SizedBox(height: 30,),
                PicksTitleWidget(),
              ],
            ),
          ),
        );
      }
    );
  }
}
