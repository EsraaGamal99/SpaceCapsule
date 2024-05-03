import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/core/theming/assets.dart';
import 'package:space_app/features/home/ui/screens/widgets/pick_card_widget.dart';

class ListOfSpaceItems extends StatelessWidget {
  final List<String> itemsTitle;
  final List<String> itemsImage;
  final void Function()? navigateTo;


  const ListOfSpaceItems({super.key, required this.itemsTitle, required this.itemsImage, required this.navigateTo, });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding:
            EdgeInsets.only(bottom: 15.0.w, left: 20.w, right: 20.w, top: 15.h),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return PickCardWidget(
                cardName: itemsTitle[index],
                imageName: itemsImage[index],
                isToDetailsScreen: true,
                onPressed: navigateTo,
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: 30.h),
            itemCount: 3),
      ),
    );
  }
}

