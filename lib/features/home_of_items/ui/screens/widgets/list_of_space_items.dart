import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/core/theming/assets.dart';
import 'package:space_app/features/home/ui/screens/widgets/pick_card_widget.dart';

class ListOfSpaceItems extends StatelessWidget {
  const ListOfSpaceItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding:
            EdgeInsets.only(bottom: 15.0.w, left: 20.w, right: 20.w, top: 15.h),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return PickCardWidget(
                isHomeScreen: false,
                cardName: cardName[index],
                imageName: imageName[index],
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: 30.h),
            itemCount: 3),
      ),
    );
  }
}

//TODO: replace it with real data when connected to api "the name and images of rockets, dragons and landpods"
List<String> cardName = ['Rockets', 'Dragons', 'Landpods',];
List<String> imageName = [
  AppAssets.rockets,
  AppAssets.galaxy,
  AppAssets.insightfulImage,
];
