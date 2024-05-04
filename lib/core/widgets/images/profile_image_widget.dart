import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/core/helpers/functions/navigate_after_splash.dart';
import 'package:space_app/features/profile/logic/edit_profile_data/edit_profile_cubit.dart';
import 'package:space_app/features/profile/logic/profile_cubit.dart';
import 'package:space_app/features/profile/logic/profile_state.dart';
import '../../helpers/functions/firebase_services.dart';
import '../../theming/assets.dart';
import '../../theming/colors.dart';

class ProfileImageWidget extends StatelessWidget {
  final String userImage;
  const ProfileImageWidget({super.key, required this.userImage});

  @override
  Widget build(BuildContext context) {
    debugPrint('---- profile image ${BlocProvider.of<ProfileCubit>(context).currentUser?.photoURL}');
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
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
              child: ClipOval(
                  child: Image.file(
                    File(userImage),
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  )
              ),
            ),
          ),
        );
      }
    );
  }
}
