import 'package:flutter/material.dart';
import 'package:space_app/core/theming/assets.dart';
import 'package:space_app/core/widgets/details_screen_body.dart';
import 'package:space_app/core/widgets/title_of_item_details.dart';
import 'package:space_app/features/landpods/data/models/landpod_model.dart';

class LandPodsDetailsScreen extends StatefulWidget {
  final LandpodModel landpodModel;
  const LandPodsDetailsScreen({super.key, required this.landpodModel});

  @override
  State<LandPodsDetailsScreen> createState() => _LandPodsDetailsScreen();
}

class _LandPodsDetailsScreen extends State<LandPodsDetailsScreen> {
  double _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.landPodsBackground,),
              fit: BoxFit.cover,
              ),
            ),
        child: SafeArea(
          child: Column(
            children: [
              TitleOfItemDetails(
                title: widget.landpodModel.name ?? '',
                region: widget.landpodModel.region,
              ),
              DetailsScreenBody(
                currentPage: _currentPage,
                description: widget.landpodModel.description ?? '',
                index: _currentPage.toInt(),
                images: widget.landpodModel.image?.large ?? [],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
