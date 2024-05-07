import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/core/theming/assets.dart';
import 'package:space_app/core/widgets/details_screen_body.dart';
import 'package:space_app/core/widgets/loading_widgets/small_loading_widget.dart';
import 'package:space_app/core/widgets/title_of_item_details.dart';
import 'package:space_app/features/rockets/data/models/rockets_model.dart';
import 'package:space_app/features/rockets/logic/one_rocket_cubit/one_rocket_cubit.dart';
import 'package:space_app/features/rockets/logic/one_rocket_cubit/one_rocket_state.dart';

class RocketDetailsScreen extends StatefulWidget {
  final RocketsModel rockeModel;

  const RocketDetailsScreen({super.key, required this.rockeModel});

  @override
  State<RocketDetailsScreen> createState() => _RocketDetailsScreenState();
}

class _RocketDetailsScreenState extends State<RocketDetailsScreen> {
  @override

  double _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    List<int> indexes =
        List.generate(widget.rockeModel.flickrImages!.length, (index) => index);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage(AppAssets.rocketsBackground),
        )),
        child: SafeArea(
          child: Column(
            children: [
              TitleOfItemDetails(
                title: widget.rockeModel.name!,
              ),
              DetailsScreenBody(
                currentPage: _currentPage,
                description: widget.rockeModel.description!,
                index: indexes,
                images: widget.rockeModel.flickrImages!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
