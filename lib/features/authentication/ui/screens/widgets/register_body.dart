import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/core/theming/text_styles.dart';
import 'package:space_app/core/widgets/buttons/custom_material_button.dart';
import 'package:space_app/features/authentication/logic/register_cubit/register_cubit.dart';
import 'package:space_app/features/authentication/ui/screens/widgets/register_bloc_listener.dart';
import 'package:space_app/features/authentication/ui/screens/widgets/user_data_section.dart';
import 'package:space_app/generated/l10n.dart';

import 'already_have_account.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});


  @override
  Widget build(BuildContext context) {
    var read = context.read<RegisterCubit>();
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 35.h,
            ),
            Text(
              S.of(context).letsTextKey,
              style: AppTextStyles.fontWhite40W500,
            ),
            Text(
              S.of(context).startWeTextKey,
              style: AppTextStyles.fontWhite63W600.copyWith(height: 1.0),
            ),
            UserDataSection(
              isLogin: false,
              nameController: read.nameController,
              emailController: read.emailController,
              passwordController: read.passwordController,
            ),
            CustomMaterialButton(
              onPressed: () async {
                await BlocProvider.of<RegisterCubit>(context).userRegistration(
                  name: read.nameController.text,
                  email: read.emailController.text,
                  password: read.passwordController.text,
                );
              },
              label: S.of(context).signUpTextKey,
            ),
            SizedBox(
              height: 10.h,
            ),
            const AlreadyHaveAnAccount(),
            SizedBox(
              height: 10.h,
            ),
            const RegisterBlocListener(),
          ],
        ),
      ),
    );
  }
}
