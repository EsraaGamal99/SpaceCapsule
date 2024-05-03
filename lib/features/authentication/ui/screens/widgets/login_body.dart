import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/core/widgets/auth_back_button.dart';

import 'package:space_app/core/widgets/buttons/animation_button.dart';
import 'package:space_app/features/authentication/logic/login_cubit/login_cubit.dart';
import 'package:space_app/features/authentication/ui/screens/widgets/login_bloc_listener.dart';
import 'package:space_app/features/authentication/ui/screens/widgets/user_data_section.dart';
import 'package:space_app/generated/l10n.dart';
import '../../../../../core/theming/text_styles.dart';
import 'do_not_have_an_account.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<LoginCubit>();
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const AuthBackButton(),
              Text(
                S.of(context).welcomeTextKey,
                style: AppTextStyles.fontWhite40W500,
              ),
              Text(
                S.of(context).backWelcomeTextKey,
                style: AppTextStyles.fontWhite63W600.copyWith(height: 1.0),
              ),
              UserDataSection(
                isLogin: true,
                emailController: cubit.emailController,
                passwordController: cubit.passwordController,
              ),
              AnimationButton(
                onPress: () async {
                  await BlocProvider.of<LoginCubit>(context).userLogin(
                    email: cubit.emailController.text,
                    password: cubit.passwordController.text,
                  );
                  },
                  label: S.of(context).logInTextKey,
              ),
              SizedBox(height: 10.h),
              const DoNotHaveAnAccount(),
              const LogInBlocListener(),
            ]),
      ),
    );
  }
}


