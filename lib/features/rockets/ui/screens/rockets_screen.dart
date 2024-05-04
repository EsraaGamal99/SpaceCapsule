import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/core/routing/routes.dart';
import 'package:space_app/core/theming/assets.dart';
import 'package:space_app/features/home_of_items/ui/screens/widgets/list_of_space_items.dart';
import 'package:space_app/features/home_of_items/ui/screens/widgets/space_item_app_bar.dart';
import 'package:space_app/features/rockets/logic/rockets_cubit/rockets_cubit.dart';

class RocketsScreen extends StatefulWidget {
  const RocketsScreen({super.key});

  @override
  State<RocketsScreen> createState() => _RocketsScreenState();
}

class _RocketsScreenState extends State<RocketsScreen> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<RocketsCubit>(context).emitGetAllRocketsStates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const SpaceItemsAppBar(
            screenTitle: 'Rockets',
          ),
          ListOfSpaceItems(
            itemsTitle: cardName,
            itemsImage: imageName,
           navigateTo: (){
             Navigator.pushNamed(context, Routes.rocketDetailsScreen);
           },
          ),
        ],
      ),
    );
  }
}

//TODO: replace it with real data when connected to api "the name and images of rockets"
List<String> cardName = [
  'Rocket_1',
  'Rocket_2',
  'Rocket_3',
];
List<String> imageName = [
  AppAssets.rockets,
  AppAssets.galaxy,
  AppAssets.insightfulImage,
];
