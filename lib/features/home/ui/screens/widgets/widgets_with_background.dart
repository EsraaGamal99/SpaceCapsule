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
    return BlocBuilder<AppThemeCubit, AppThemeState>(builder: (context, state) {
      return Center(
        child: Container(
          //   height: 320.h,
          padding: EdgeInsets.only(right: 30.w, left: 30.w, top: 70.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.only(
                  bottomEnd: Radius.circular(20.r),
                  bottomStart: Radius.circular(20.r)),
              image: DecorationImage(
                image: AssetImage(
                  AppThemeCubit.isDarkMode
                      ? AppAssets.homeBackgroundImage
                      : AppAssets.homeBackgroundLightModeImage,
                ),
                fit: BoxFit.cover,
              )),

          child: Column(
            children: [
              const AppBarWidget(),
              SizedBox(height: 30.h),
              const PicksTitleWidget(),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      );
    });
  }
}
