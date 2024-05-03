import 'package:flutter/material.dart';
import 'package:space_app/core/helpers/extenstions.dart';
import '../../../core/theming/assets.dart';

class OnBoardingData {
  final String title;
  final String description;
  final String image;

  OnBoardingData({required this.title, required this.description, required this.image});
}

getOnBoardingData(BuildContext context) {
  return [
    OnBoardingData(title: context.translate.translate.insightsTextKey,   description: context.translate.translate.embarkOnAnInterstellarTextKey, image: AppAssets.onBoarding1),
    OnBoardingData(title: context.translate.translate.galaxiesTextKey,   description: context.translate.translate.exploreTheMarvelsTextKey,      image: AppAssets.onBoarding2),
    OnBoardingData(title: context.translate.translate.rocketsTextKey,    description: context.translate.translate.stellarDiscoveriesTextKey,     image: AppAssets.onBoarding3),
    OnBoardingData(title: context.translate.translate.planetsTextKey,    description: context.translate.translate.embarkOnAnInterstellarTextKey, image: AppAssets.onBoarding4),
    OnBoardingData(title: context.translate.translate.satellitesTextKey, description: context.translate.translate.ventureIntoTextKey,            image: AppAssets.onBoarding5),
  ];
}

