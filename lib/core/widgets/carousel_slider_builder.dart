import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/url_checker.dart';

class CarouselSliderBuilder extends StatefulWidget {
  final ValueChanged<double> onPageChanged;
  final List<String> images;
  final List<int> index;
  final int imagesCount;

  CarouselSliderBuilder(
      {super.key,
      required this.onPageChanged,
      required this.images,
      required this.imagesCount, required this.index});

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

        child: CachedNetworkImage(
          imageUrl: widget.images[widget.index[index]],
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width * 0.85,
        ),
      ),
      options: CarouselOptions(
        aspectRatio: 16 / 9,
        autoPlay: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 3000),
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
