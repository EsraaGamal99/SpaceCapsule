import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/theming/assets.dart';
import '../../../../core/theming/colors.dart';

class ChangeProfileImage extends StatefulWidget {
  const ChangeProfileImage({super.key});

  @override
  State<ChangeProfileImage> createState() => _ChangeProfileImageState();
}

class _ChangeProfileImageState extends State<ChangeProfileImage> {
  File? _image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
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
              child: _image != null
                  ? Image.file(
                    _image!,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  )
                  : Image.asset(
                    AppAssets.userPlaceHolder,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: -2,
          child: InkWell(
            onTap: () => showChooseImageDialog(
              context: context,
              onCameraTapped: (source) => pickImage(source),
              onGalleryTapped: (source) => pickImage(source),
            ),
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryWhiteColor,
              ),
              child: Icon(Icons.edit_outlined,
                  size: 30.sp, color: AppColors.primaryBlackColor),
            ),
          ),
        ),
      ],
    );
  }

  Future pickImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
    return;
  }
}


void showChooseImageDialog({
  required BuildContext context,
  required Function(ImageSource) onCameraTapped,
  required Function(ImageSource) onGalleryTapped,
}) {
  showModalBottomSheet(
    context: context,
    backgroundColor: AppColors.primaryMidnightGreyColor,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.camera_alt, color: AppColors.primaryWhiteColor),
              title: const Text('Camera', style: TextStyle(color: AppColors.primaryWhiteColor)),
              onTap: () async {
                Navigator.pop(context);
                await onCameraTapped(ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library, color: AppColors.primaryWhiteColor),
              title: const Text('Gallery', style: TextStyle(color: AppColors.primaryWhiteColor)),
              onTap: () async {
                Navigator.pop(context);
                await onGalleryTapped(ImageSource.gallery);
              },
            ),
          ],
        ),
      );
    },
  );
}
