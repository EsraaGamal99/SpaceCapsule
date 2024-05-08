import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:space_app/core/helpers/enums.dart';
import 'package:space_app/core/routing/routes.dart';
import 'package:space_app/core/theming/assets.dart';
import 'package:space_app/core/theming/colors.dart';
import 'package:space_app/core/helpers/extenstions.dart';
import 'package:space_app/features/localization/logic/localization_cubit.dart';
import '../../../../../core/theming/text_styles.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PickCardWidget extends StatelessWidget {
  final CardType? cardType;
  final String cardName;
  final String? locality;
  final String imageName;
  final bool isToDetailsScreen;
  final void Function()? onPressed;

  const PickCardWidget(
      {super.key,
        this.cardType,
      required this.cardName,
      this.locality,
      required this.imageName,
      required this.isToDetailsScreen,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isToDetailsScreen == true && cardType == null
          ? onPressed
          : () {
             cardType == CardType.rockets
                  ? Navigator.pushNamed(context, Routes.rocketsScreen)
                  : (cardType == CardType.dragons)
                      ? Navigator.pushNamed(context, Routes.dragonScreen)
                      : Navigator.pushNamed(context, Routes.landPodsScreen);
            },
      child: Container(
        width: 370.w,
        height: 196.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.h),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: isToDetailsScreen
                    ? DecorationImage(
                        image: CachedNetworkImageProvider(imageName),
                        fit: BoxFit.cover,
                      )
                    : DecorationImage(
                        image: AssetImage(imageName),
                        fit: BoxFit.cover,
                      ),
                borderRadius: BorderRadius.circular(20.h),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.h),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.primaryWhiteColor.withOpacity(0.1),
                        AppColors.primaryBlackColor.withOpacity(0.8),
                      ],
                      stops: const [
                        0.0,
                        1.9
                      ]),
                ),
              ),
            ),
            Positioned(
              bottom: 10.h,
              child: Container(
                padding: EdgeInsetsDirectional.only(end: 20.w),
                width: MediaQuery.of(context).size.width - 40.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(start: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              locality ?? '',
                              style: AppTextStyles.fontWhite15W500,
                            ),
                            Text(
                              cardName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.fontWhite33W600,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Padding(
                      padding: EdgeInsetsDirectional.only(end: isToDetailsScreen ? 0.w : 20.0.w),
                      child: MaterialButton(
                        onPressed: isToDetailsScreen == true
                            ? onPressed
                            : () {
                          cardType == CardType.rockets
                              ? Navigator.pushNamed(context, Routes.rocketsScreen)
                              : (cardType == CardType.dragons)
                              ? Navigator.pushNamed(context, Routes.dragonScreen)
                              : Navigator.pushNamed(context, Routes.landPodsScreen);
                        },
                        color: AppColors.primaryMediumGrayColor.withOpacity(0.4),
                        padding: EdgeInsets.all(6.h),
                        height: 54.h,
                        minWidth: 59.w,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.h)),
                        child: RotatedBox(
                          quarterTurns:
                              BlocProvider.of<LocalizationCubit>(context)
                                      .isArabic()
                                  ? 2
                                  : 0,
                          child: SvgPicture.asset(
                            AppAssets.forwardArrowIcon,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
