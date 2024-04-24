import '../../../core/helpers/constants_strings.dart';
import '../../../core/theming/assets.dart';

class OnBoardingData {
  final String title;
  final String description;
  final String image;

  OnBoardingData({required this.title, required this.description, required this.image});
}

List<OnBoardingData> onBoardingData = [
  OnBoardingData(title: insightsTextKey,   description: embarkOnAnInterstellarTextKey, image: AppAssets.onBoarding1),
  OnBoardingData(title: galaxiesTextKey,   description: exploreTheMarvelsTextKey,      image: AppAssets.onBoarding2),
  OnBoardingData(title: rocketsTextKey,    description: stellarDiscoveriesTextKey,     image: AppAssets.onBoarding3),
  OnBoardingData(title: planetsTextKey,    description: embarkOnAnInterstellarTextKey, image: AppAssets.onBoarding4),
  OnBoardingData(title: satellitesTextKey, description: ventureIntoTextKey,            image: AppAssets.onBoarding5),
];