import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:space_app/features/localization/logic/localization_cubit.dart';

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
      child: RotatedBox(
        quarterTurns: BlocProvider.of<LocalizationCubit>(context).isArabic() ? 2 : 0,
        child: SvgPicture.asset(
          AppAssets.backArrowIcon,
          width: 20.w,color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
