import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../theming/assets.dart';
import '../../theming/colors.dart';
import '../loading_widgets/small_loading_widget.dart';

class ProfileImageWidget extends StatelessWidget {
  final String userImage;
  const ProfileImageWidget({super.key, required this.userImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: const BoxDecoration(
        color: AppColors.primaryMidnightGreyColor,
        shape: BoxShape.circle,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: const BoxDecoration(
          color: AppColors.primarySmokeyGreyColor,
          shape: BoxShape.circle,
        ),
        child: ClipOval(
          child: CachedNetworkImage(
            imageUrl: userImage,
            placeholder: (context, url) => const SmallLoadingWidget(),
            errorWidget: (context, url, error) => Image.asset(
              AppAssets.userPlaceHolder,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
