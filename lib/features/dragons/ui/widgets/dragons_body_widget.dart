import 'package:flutter/material.dart';

import '../../../../core/theming/assets.dart';
import '../../../home_of_items/ui/screens/widgets/space_item_app_bar.dart';
import 'dragons_builder.dart';
class DragonsBodyWidget extends StatelessWidget {
  const DragonsBodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppAssets.dragonsBackground),
                fit: BoxFit.cover
            )),
        child:const Column(
          children: [
            SpaceItemsAppBar(
              screenTitle: 'Dragons',
            ),
            DragonsBlocBuilder(),
          ],
        ),
      ),
    );
  }
}
