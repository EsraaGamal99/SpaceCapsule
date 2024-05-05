import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/url_checker.dart';

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
      itemBuilder: (context, index, realIndex) => ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child:  UrlChecker.isImageUrl( widget.image)
            ? CachedNetworkImage(imageUrl: widget.image,fit: BoxFit.cover,): Image.asset(
          widget.image,fit: BoxFit.cover,
        ),
      ),
      options: CarouselOptions(
        aspectRatio: 16 / 9,
        autoPlay: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 1500),
        autoPlayInterval: const Duration(seconds: 3),
        height: 200.0.h,
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
