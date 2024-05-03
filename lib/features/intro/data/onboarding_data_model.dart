import '../../../core/helpers/constants_strings.dart';
import '../../../core/theming/app_theme_cubit/app_theme_cubit.dart';
import '../../../core/theming/assets.dart';

class OnBoardingData {
  final String title;
  final String description;
  final String image;

  OnBoardingData({required this.title, required this.description, required this.image});
}

List<OnBoardingData> onBoardingData = [
  OnBoardingData(title: insightsTextKey,   description: embarkOnAnInterstellarTextKey, image: AppThemeCubit.isDarkMode ? AppAssets.onBoarding1 :  AppAssets.onBoarding1LightMode),
  OnBoardingData(title: galaxiesTextKey,   description: exploreTheMarvelsTextKey,      image: AppThemeCubit.isDarkMode ? AppAssets.onBoarding2 :  AppAssets.onBoarding2LightMode),
  OnBoardingData(title: rocketsTextKey,    description: stellarDiscoveriesTextKey,     image: AppThemeCubit.isDarkMode ? AppAssets.onBoarding3 : AppAssets.onBoarding3LightMode),
  OnBoardingData(title: planetsTextKey,    description: embarkOnAnInterstellarTextKey, image: AppThemeCubit.isDarkMode ? AppAssets.onBoarding4 : AppAssets.onBoarding4LightMode),
  OnBoardingData(title: satellitesTextKey, description: ventureIntoTextKey,            image: AppThemeCubit.isDarkMode ? AppAssets.onBoarding5 : AppAssets.onBoarding5LightMode),
];