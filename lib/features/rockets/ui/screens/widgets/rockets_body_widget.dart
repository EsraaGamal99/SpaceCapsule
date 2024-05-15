import 'package:flutter/material.dart';
import 'package:space_app/features/rockets/ui/screens/widgets/rockets_bloc_builder.dart';

import '../../../../../core/theming/assets.dart';
import '../../../../home_of_items/ui/screens/widgets/space_item_app_bar.dart';

class RocketsBodyWidget extends StatelessWidget {
  const RocketsBodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.rocketsBackground),
              fit: BoxFit.cover,
            )),
        child: const Column(
          children: [
            SpaceItemsAppBar(
              screenTitle: 'Rockets',
            ),
            RocketsBlocBuilder(),
          ],
        ),
      ),
    );
  }
}
