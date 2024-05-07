import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/theming/assets.dart';
import '../../../../core/theming/colors.dart';
import 'show_choose_image_source_bottom_sheet.dart';

class ChangeProfileImageWidget extends StatefulWidget {
  const ChangeProfileImageWidget({super.key});

  @override
  State<ChangeProfileImageWidget> createState() => _ChangeProfileImageWidgetState();
}

class _ChangeProfileImageWidgetState extends State<ChangeProfileImageWidget> {
  File? _image;

  Future pickImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

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
      ],
    );
  }
}

