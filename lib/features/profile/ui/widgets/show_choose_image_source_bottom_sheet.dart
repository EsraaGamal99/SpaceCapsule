import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/theming/colors.dart';
import 'choose_image_source_widget.dart';

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