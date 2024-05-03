import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/core/theming/assets.dart';
import 'package:space_app/core/theming/colors.dart';
import 'package:space_app/core/theming/text_styles.dart';
import 'package:space_app/core/widgets/carousel_slider_builder.dart';
import 'package:space_app/core/widgets/smooth_indicator.dart';
import 'package:space_app/core/widgets/title_of_item_details.dart';

class RocketDetailsScreen extends StatefulWidget {
  const RocketDetailsScreen({super.key});

  @override
  State<RocketDetailsScreen> createState() => _RocketDetailsScreenState();
}

class _RocketDetailsScreenState extends State<RocketDetailsScreen> {
  double _currentPage = 0;

  @override
  Widget build(BuildContext context) {
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
              const TitleOfItemDetails(
                title: 'Rocket_1',
              ),
              DetailsScreenBody(
                currentPage: _currentPage,
                description:
                    'Planet Earth is the third planet from the Sun in our solar system. It is a unique and diverse world, home to a wide variety of life, including humans. Earth has a rich atmosphere that sustains life, vast oceans covering much of its surface, and a diverse range of ecosystems, making it a remarkable and beautiful planet.',
                index: _currentPage.toInt(),
                images: [AppAssets.galaxy, AppAssets.rockets, AppAssets.insightfulImage],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailsScreenBody extends StatefulWidget {
  double currentPage;
  final String description;
  final List<String> images;
  final int index;

  DetailsScreenBody(
      {super.key,
      required this.currentPage,
      required this.description,
      required this.index,
      required this.images});

  @override
  State<DetailsScreenBody> createState() => _DetailsScreenBodyState();
}

class _DetailsScreenBodyState extends State<DetailsScreenBody> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSliderBuilder(
                onPageChanged: (page) {
                  setState(() {
                    widget.currentPage = page;
                  });
                },
                image: widget.images[widget.currentPage.toInt()],
                imagesCount: widget.images.length,
              ),
              CustomSmoothIndicator(
                currentPage: widget.currentPage,
                boardLength: widget.images.length,
              ),
              SizedBox(height: 45.h),
              Text(
                'Description',
                style: AppTextStyles.fontLighterGray23W600,
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  widget.description,
                  style: AppTextStyles.fontWhite18W500.copyWith(
                    color: AppColors.primaryMediumGrayColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
