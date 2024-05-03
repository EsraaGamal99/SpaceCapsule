import 'package:flutter/material.dart';
import 'package:space_app/features/home/ui/screens/widgets/pick_card_widget.dart';
import 'package:space_app/core/theming/assets.dart';
import 'package:space_app/generated/l10n.dart';

class ListPicksWidget extends StatelessWidget {
  const ListPicksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return PickCardWidget(cardName: getCardTitle(context)[index],imageName: imageName[index],);
        },
        separatorBuilder: (context, index) => const SizedBox(height: 15),
        itemCount: 3);
  }
}

getCardTitle(BuildContext context) {
  return [
    S.of(context).rocketsTextKey,
    S.of(context).dragonsTextKey,
    S.of(context).landpadsTextKey,
  ];
}
List<String> imageName = [AppAssets.rockets, AppAssets.galaxy, AppAssets.insightfulImage];
