import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:space_app/core/theming/assets.dart';
import 'package:space_app/core/widgets/loading_widgets/small_loading_widget.dart';

class CarouselSliderBuilder extends StatefulWidget {
  final ValueChanged<double> onPageChanged;
  final String image;
  final int imagesCount;

  CarouselSliderBuilder({super.key, required this.onPageChanged, required this.image, required this.imagesCount});

  @override
  State<CarouselSliderBuilder> createState() => _CarouselSliderBuilderState();
}

class _CarouselSliderBuilderState extends State<CarouselSliderBuilder> {
  double _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: widget.imagesCount,
      itemBuilder: (context, index, realIndex) => Container(
        clipBehavior: Clip.antiAlias,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        //TODO: replace it with cachedNetworkImage when connected to api
        child: CachedNetworkImage(
          imageUrl: widget.image,
          fit: BoxFit.cover,
          progressIndicatorBuilder: (context, url, builder) => const SmallLoadingWidget(),
          errorWidget: (context, url, error) =>
              Image.asset(AppAssets.galaxy),
        )
      ),
      options: CarouselOptions(
        aspectRatio: 16 / 9,
        autoPlay: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 1500),
        autoPlayInterval: const Duration(seconds: 3),
        height: 200.0,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlayCurve: Curves.fastOutSlowIn,
        scrollDirection: Axis.horizontal,
        viewportFraction: 1.0,
        enlargeCenterPage: true,
        onPageChanged: (index, reason) {
          setState(() {
            _currentPage = index.toDouble();
          });
          widget.onPageChanged(_currentPage);
        },
      ),
    );
  }
}
