import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/core/helpers/functions/show_snack_bar.dart';
import 'package:space_app/core/helpers/functions/show_toat.dart';
import 'package:space_app/core/routing/routes.dart';
import 'package:space_app/core/theming/colors.dart';
import 'package:space_app/core/widgets/auth_back_button.dart';
import 'package:space_app/core/widgets/custom_loading_widget.dart';
import 'package:space_app/features/authentication/logic/login_cubit/login_cubit.dart';
import 'package:space_app/features/authentication/ui/screens/widgets/user_data_section.dart';
import '../../../../../core/helpers/constants_strings.dart';
import '../../../../../core/theming/text_styles.dart';
import '../../../../../core/widgets/custom_material_button.dart';

class LoginBody extends StatelessWidget {
  LoginBody({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginErrorState) {
          showSnackBar(context, state.errMessage);
        } else if (state is LoginSuccessState) {
          Navigator.pushReplacementNamed(context, Routes.homeScreen);
           showToast(
            msg: 'You logged in successfully',
            backgroundColor: AppColors.primaryMediumGrayColor,
          );
        }
      },
      builder: (context, state) => Padding(
        padding: const EdgeInsets.all(50.0),
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const AuthBackButton(),
                Text(
                  welcomeTextKey,
                  style: AppTextStyles.fontWhite40W500,
                ),
                Text(
                  backTextKey,
                  style: AppTextStyles.fontWhite63W600,
                ),
                UserDataSection(
                  isLogin: true,
                  emailController: emailController,
                  passwordController: passwordController,
                ),
                ConditionalBuilder(
                  condition: state is! LoginLoadingState,
                  builder: (context) => CustomMaterialButton(
                      onPressed: () async {
                        await BlocProvider.of<LoginCubit>(context).userLogin(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                      },
                      label: logInTextKey),
                  fallback: (context) => const CustomLoadingWidget(),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      forgotPasswordTextKey,
                      style: AppTextStyles.fontWhite14W500WithUnderLine,
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
