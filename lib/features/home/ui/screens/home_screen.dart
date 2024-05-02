import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.homeBackgroundImage,),
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
      ),
    );
  }
}
