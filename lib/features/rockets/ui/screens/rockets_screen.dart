import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/core/theming/assets.dart';
import 'package:space_app/features/home_of_items/ui/screens/widgets/space_item_app_bar.dart';
import 'package:space_app/features/rockets/logic/rockets_cubit/rockets_cubit.dart';
import 'package:space_app/features/rockets/ui/screens/widgets/rockets_bloc_builder.dart';

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
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage(AppAssets.rocketsBackground),
          //fit: BoxFit.cover,
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

