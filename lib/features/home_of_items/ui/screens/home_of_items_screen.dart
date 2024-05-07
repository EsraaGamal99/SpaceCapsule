import 'package:flutter/material.dart';
import 'package:space_app/core/theming/assets.dart';
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
