import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../theming/colors.dart';

class CustomSmoothIndicator extends StatelessWidget {
  const CustomSmoothIndicator({
    super.key,
    required this.currentPage,
    required this.boardLength,
  });

  final double currentPage;
  final int boardLength;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SmoothPageIndicator(
        controller: PageController(initialPage: currentPage.toInt()),
        count: boardLength,
        effect: CustomizableEffect(
          dotDecoration: DotDecoration(
            color: Colors.grey,
            width: 8,
            height: 8,
            borderRadius: BorderRadius.circular(8),
          ),
          activeDotDecoration: DotDecoration(
            color: AppColors.primaryWhiteColor,
            borderRadius: BorderRadius.circular(8),
            height: 8,
            width: 25,
          ),
        ),
      ),
    );
  }
}
