import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:space_app/features/profile/logic/profile_cubit.dart';
import 'package:space_app/features/profile/logic/profile_state.dart';

import '../../../../core/theming/assets.dart';
import '../../../../core/theming/colors.dart';
import 'show_choose_image_source_bottom_sheet.dart';

// class ChangeProfileImageWidget extends StatefulWidget {
//   final String? image;
//   const ChangeProfileImageWidget({super.key, required this.image});
//
//   @override
//   State<ChangeProfileImageWidget> createState() => _ChangeProfileImageWidgetState();
// }
//
// class _ChangeProfileImageWidgetState extends State<ChangeProfileImageWidget> {
//   File? _image;
//
//   Future pickImage(ImageSource imageSource) async {
//     final pickedFile = await ImagePicker().pickImage(source: imageSource);
//     if (pickedFile != null) {
//       BlocProvider.of<ProfileCubit>(context).updatePhoto(photoURL: pickedFile.path);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Container(
//           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//           decoration: const BoxDecoration(
//             color: AppColors.primaryMidnightGreyColor,
//             shape: BoxShape.circle,
//           ),
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
//             decoration: const BoxDecoration(
//               color: AppColors.primarySmokeyGreyColor,
//               shape: BoxShape.circle,
//             ),
//             child: ClipOval(
//               child: BlocBuilder<ProfileCubit, ProfileState>(
//                 builder: (context, state) {
//                   debugPrint('ProfileState CachedNetworkImage: ${(state as Success).user.photoURL ?? ''}');
//                   return CachedNetworkImage(
//                     imageUrl: state is Success && state.user.photoURL != null ? state.user.photoURL! : AppAssets.userPlaceHolder,
//                     width: 100,
//                     height: 100,
//                     fit: BoxFit.cover,
//                     placeholder: (context, url) => const SmallLoadingWidget(),
//                     errorWidget: (context, url, error) => Image.asset(
//                       AppAssets.userPlaceHolder,
//                       width: 100,
//                       height: 100,
//                       fit: BoxFit.cover,
//                     ),
//                   );
//                 }
//               ),
//               // widget.image != null
//               //     ? Image.file(
//               //       widget.image!,
//               //       width: 100,
//               //       height: 100,
//               //       fit: BoxFit.cover,
//               //     )
//               //     : Image.asset(
//               //       AppAssets.userPlaceHolder,
//               //       width: 100,
//               //       height: 100,
//               //       fit: BoxFit.cover,
//               //     ),
//             ),
//           ),
//         ),
//         Positioned(
//           bottom: 0,
//           right: -2,
//           child: InkWell(
//             onTap: () => showChooseImageSourceBottomSheet(
//               context: context,
//               onCameraTapped: (source) => pickImage(source),
//               onGalleryTapped: (source) => pickImage(source),
//             ),
//             child: Container(
//               width: 40.w,
//               height: 40.h,
//               decoration: const BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: AppColors.primaryWhiteColor,
//               ),
//               child: Icon(Icons.edit_outlined, size: 30.sp, color: AppColors.primaryBlackColor),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

class ChangeProfileImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
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
                  child: state.maybeWhen(
                    success: (user) {
                      debugPrint('ProfileState CachedNetworkImage: ${user.photoURL ?? ''}');
                      return Image.file(
                        File(user.photoURL ?? ''),
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      );
                      // return CachedNetworkImage(
                      //   imageUrl: user.photoURL ?? AppAssets.userPlaceHolder,
                      //   width: 100,
                      //   height: 100,
                      //   fit: BoxFit.cover,
                      //   placeholder: (context, url) => const SmallLoadingWidget(),
                      //   errorWidget: (context, url, error) => Image.asset(
                      //     AppAssets.userPlaceHolder,
                      //     width: 100,
                      //     height: 100,
                      //     fit: BoxFit.cover,
                      //   ),
                      // );
                    },
                    orElse: () => Image.asset(
                      AppAssets.userPlaceHolder,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: -2,
              child: InkWell(
                onTap: () => showChooseImageSourceBottomSheet(
                  context: context,
                  onCameraTapped: (source) => pickImage(source, context),
                  onGalleryTapped: (source) => pickImage(source, context),
                ),
                child: Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryWhiteColor,
                  ),
                  child: Icon(Icons.edit_outlined, size: 30.sp, color: AppColors.primaryBlackColor),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future pickImage(ImageSource imageSource, BuildContext context) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      BlocProvider.of<ProfileCubit>(context).updatePhoto(photoURL: pickedFile.path);
      BlocProvider.of<ProfileCubit>(context).getUserProfile(context);
    }
  }
}
