import 'package:flutter/material.dart';
import 'package:space_app/core/routing/routes.dart';
import 'package:space_app/core/theming/assets.dart';
import 'package:space_app/features/home/ui/screens/widgets/list_picks_widget.dart';
import 'package:space_app/features/home_of_items/ui/screens/widgets/list_of_space_items.dart';
import 'widgets/space_item_app_bar.dart';

class HomeOfItemsScreen extends StatelessWidget {
  final String screenTitle;
  const HomeOfItemsScreen({super.key, required this.screenTitle});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SpaceItemsAppBar(screenTitle: screenTitle,),
        ],
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
