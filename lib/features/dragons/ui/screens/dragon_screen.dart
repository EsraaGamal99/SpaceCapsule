import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/core/routing/routes.dart';
import 'package:space_app/core/theming/assets.dart';
import 'package:space_app/features/dragons/ui/widgets/dragons_builder.dart';
import 'package:space_app/features/home_of_items/ui/screens/widgets/list_of_space_items.dart';
import 'package:space_app/features/home_of_items/ui/screens/widgets/space_item_app_bar.dart';

import '../../logic/dragon_cubit.dart';

class DragonScreen extends StatefulWidget {
  const DragonScreen({super.key});

  @override
  State<DragonScreen> createState() => _DragonScreenState();
}

class _DragonScreenState extends State<DragonScreen> {

  @override
  void initState() {
    super.initState();
    context.read<DragonCubit>().emitGetAllDragonsStates();
  }
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