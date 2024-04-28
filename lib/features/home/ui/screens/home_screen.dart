import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/features/home/ui/screens/widgets/app_bar_widget.dart';
import 'package:space_app/features/home/ui/screens/widgets/list_picks_widget.dart';
import 'package:space_app/features/home/ui/screens/widgets/pick_card_widget.dart';
import 'package:space_app/features/home/ui/screens/widgets/picks_title_widget.dart';
import 'package:space_app/features/home/ui/screens/widgets/search_text_field_widget.dart';

import '../../../../core/theming/assets.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.homeBackgroundImage,),
                fit: BoxFit.fill,
              )
          ),
         padding: EdgeInsets.symmetric(horizontal: 30.w,vertical: 70.h),
          child: Column(
            children: [
              AppBarWidget(),
              SizedBox(height: 30,),
              SearchTextFieldWidget(),
              SizedBox(height: 30,),
              PicksTitleWidget(),
              //SizedBox(height: 30,),
              ListPicksWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
