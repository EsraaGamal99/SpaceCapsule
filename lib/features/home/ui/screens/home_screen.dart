import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/core/theming/app_theme_cubit/app_theme_cubit.dart';
import 'package:space_app/core/theming/app_theme_cubit/app_theme_state.dart';
import 'package:space_app/features/home/ui/screens/widgets/app_bar_widget.dart';
import 'package:space_app/features/home/ui/screens/widgets/list_picks_widget.dart';
import 'package:space_app/features/home/ui/screens/widgets/picks_title_widget.dart';

import '../../../../core/theming/assets.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.black,
      body: BlocBuilder<AppThemeCubit, AppThemeState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppThemeCubit.isDarkMode ? AppAssets.homeBackgroundImage: AppAssets.homeBackgroundLightModeImage,),
                    fit: BoxFit.fill,
                  )
              ),
             padding: EdgeInsets.symmetric(horizontal: 30.w,vertical: 70.h),
              child: const Column(
                children: [
                  AppBarWidget(),
                  SizedBox(height: 30,),
                  PicksTitleWidget(),
                  ListPicksWidget(),

                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
