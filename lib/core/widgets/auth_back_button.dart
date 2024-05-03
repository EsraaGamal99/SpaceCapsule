import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../theming/assets.dart';

class AuthBackButton extends StatelessWidget {
  const AuthBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pop(context);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey.withOpacity(0.2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0.r),
        ),
        fixedSize: Size(90.w, 20.h),
      ),
      child: SvgPicture.asset(
        AppAssets.backArrowIcon,color: Theme.of(context).colorScheme.primary,
        width: 20.w,
      ),
    );
  }
}
