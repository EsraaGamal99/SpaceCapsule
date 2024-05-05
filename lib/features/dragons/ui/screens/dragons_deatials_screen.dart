import 'package:flutter/material.dart';
import 'package:space_app/core/theming/assets.dart';
import 'package:space_app/core/widgets/details_screen_body.dart';
import 'package:space_app/core/widgets/title_of_item_details.dart';

import '../../data/models/dragon_model.dart';

class DragonsDetailsScreen extends StatefulWidget {
  DragonModel dragonModel;
  DragonsDetailsScreen({super.key, required this.dragonModel});

  @override
  State<DragonsDetailsScreen> createState() => _DragonsDetailsScreen();
}

class _DragonsDetailsScreen extends State<DragonsDetailsScreen> {
  double _currentPage = 0;
  //TODO: replace it with this logic "List<int> indexes = List.generate(state.data.flickrImages.length, (index) => index);"
  //at the build of success state "like at the rockets details screen"
  List<int> indexes = List.generate(2, (index) => index);

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
        child: SafeArea(
          child: Column(
            children: [
              TitleOfItemDetails(
                title: widget.dragonModel.name!,
              ),
              DetailsScreenBody(
                currentPage: _currentPage,
                description:  widget.dragonModel.description!,
                index: _currentPage.toInt(),
                images: widget.dragonModel.flickrImages!,

              ),
            ],
          ),
        ),
      ),
    );
  }
}

