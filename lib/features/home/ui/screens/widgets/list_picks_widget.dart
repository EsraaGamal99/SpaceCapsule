import 'package:flutter/material.dart';
import 'package:space_app/features/home/ui/screens/widgets/pick_card_widget.dart';
import 'package:space_app/core/theming/assets.dart';


class ListPicksWidget extends StatelessWidget {
  const ListPicksWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return PickCardWidget(cardName: cardName[index],imageName: imageName[index],);
        },
        separatorBuilder: (context, index) => const SizedBox(
              height: 15,
            ),
        itemCount: 4);
  }
}

List<String> cardName = ['Rockets', 'Dragons', 'Landpods'];
List<String> imageName = [AppAssets.rockets, AppAssets.galaxy, AppAssets.insightfulImage];
