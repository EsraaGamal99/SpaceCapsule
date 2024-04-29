import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../theming/assets.dart';

class SmallLoadingWidget extends StatelessWidget {
  const SmallLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(AppAssets.smallLoading, width: 100.w, height: 100.h),
    );
  }
}
