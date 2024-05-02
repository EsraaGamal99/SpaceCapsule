import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:space_app/generated/l10n.dart';

import '../../../../core/theming/colors.dart';

void showChooseImageSourceBottomSheet({
  required BuildContext context,
  required Function(ImageSource) onCameraTapped,
  required Function(ImageSource) onGalleryTapped,
}) {
  showModalBottomSheet(
    context: context,
    backgroundColor: AppColors.primaryMidnightGreyColor,
    builder: (BuildContext context) {
      return ChooseImageSourceWidget(onCameraTapped: onCameraTapped, onGalleryTapped: onGalleryTapped,);
    },
  );
}

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
            title: Text(S.of(context).cameraTextKey, style: const TextStyle(color: AppColors.primaryWhiteColor)),
            onTap: () async {
              Navigator.pop(context);
              await onCameraTapped(ImageSource.camera);
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo_library_rounded, color: AppColors.primaryWhiteColor),
            title: Text(S.of(context).galleryTextKey, style: const TextStyle(color: AppColors.primaryWhiteColor)),
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
