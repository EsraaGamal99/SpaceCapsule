import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/core/routing/routes.dart';
import 'package:space_app/core/theming/assets.dart';
import 'package:space_app/features/home_of_items/ui/screens/widgets/list_of_space_items.dart';
import 'package:space_app/features/home_of_items/ui/screens/widgets/space_item_app_bar.dart';
import 'package:space_app/features/landpods/logic/landpod_cubit.dart';
import 'package:space_app/features/landpods/ui/widgets/lanpods_list.dart';

class LandPodsScreen extends StatefulWidget {
  const LandPodsScreen({super.key});

  @override
  State<LandPodsScreen> createState() => _LandPodsScreenState();
}

class _LandPodsScreenState extends State<LandPodsScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<LandpodCubit>(context).fetchLandpods(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.landPodsBackground),
              fit: BoxFit.cover,
            )),
        child: const Column(
          children: [
            SpaceItemsAppBar(
              screenTitle: 'Land Pods',
            ),
            LandPodsList(),
          ],
        ),
      ),
    );
  }
}
