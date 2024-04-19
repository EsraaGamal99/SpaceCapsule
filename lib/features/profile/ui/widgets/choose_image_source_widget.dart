import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/helpers/constants_strings.dart';
import '../../../../core/theming/colors.dart';

class ChooseImageSourceWidget extends StatelessWidget {
  final Function(ImageSource) onCameraTapped;
  final Function(ImageSource) onGalleryTapped;
  const ChooseImageSourceWidget({super.key, required this.onCameraTapped, required this.onGalleryTapped});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.camera_alt_rounded, color: AppColors.primaryWhiteColor),
            title: const Text(cameraTextKey, style: TextStyle(color: AppColors.primaryWhiteColor)),
            onTap: () async {
              Navigator.pop(context);
              await onCameraTapped(ImageSource.camera);
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo_library_rounded, color: AppColors.primaryWhiteColor),
            title: const Text(galleryTextKey, style: TextStyle(color: AppColors.primaryWhiteColor)),
            onTap: () async {
              Navigator.pop(context);
              await onGalleryTapped(ImageSource.gallery);
            },
          ),
        ],
      ),
    );
  }
}
