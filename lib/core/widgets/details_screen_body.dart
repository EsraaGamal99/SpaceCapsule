import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/core/theming/colors.dart';
import 'package:space_app/core/theming/text_styles.dart';
import 'package:space_app/core/widgets/smooth_indicator.dart';

import 'carousel_slider_builder.dart';

class DetailsScreenBody extends StatefulWidget {
  double currentPage;
  final String description;
  final List<String> images;
  final List<int> index;

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
                images: widget.images,
                imagesCount: widget.images.length,
                index: widget.index,
              ),
              SizedBox(height: 10.h),
              CustomSmoothIndicator(
                currentPage: widget.currentPage,
                boardLength: widget.images.length,
              ),
              SizedBox(height: 45.h),
              // Text(
              //   'Description',
              //   style: AppTextStyles.fontLighterGray23W600,
              // ),
              // SizedBox(height: 10.h),
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
