import 'package:flutter/material.dart';
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
          const ListOfSpaceItems(),
        ],
      ),
    );
  }
}



