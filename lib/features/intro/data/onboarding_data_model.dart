import 'package:flutter/cupertino.dart';
import 'package:space_app/generated/l10n.dart';

import '../../../core/theming/assets.dart';

class OnBoardingData {
  final String title;
  final String description;
  final String image;

  OnBoardingData({required this.title, required this.description, required this.image});
}

getOnBoardingData(BuildContext context) {
  return [
    OnBoardingData(title: S.of(context).insightsTextKey,   description: S.of(context).embarkOnAnInterstellarTextKey, image: AppAssets.onBoarding1),
    OnBoardingData(title: S.of(context).galaxiesTextKey,   description: S.of(context).exploreTheMarvelsTextKey,      image: AppAssets.onBoarding2),
    OnBoardingData(title: S.of(context).rocketsTextKey,    description: S.of(context).stellarDiscoveriesTextKey,     image: AppAssets.onBoarding3),
    OnBoardingData(title: S.of(context).planetsTextKey,    description: S.of(context).embarkOnAnInterstellarTextKey, image: AppAssets.onBoarding4),
    OnBoardingData(title: S.of(context).satellitesTextKey, description: S.of(context).ventureIntoTextKey,            image: AppAssets.onBoarding5),
  ];
}