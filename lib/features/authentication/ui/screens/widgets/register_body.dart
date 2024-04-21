import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/core/helpers/constants_strings.dart';
import 'package:space_app/core/helpers/functions/show_snack_bar.dart';
import 'package:space_app/core/helpers/functions/success_register_show_dialog.dart';
import 'package:space_app/core/theming/text_styles.dart';
import 'package:space_app/core/widgets/custom_loading_widget.dart';
import 'package:space_app/core/widgets/custom_material_button.dart';
import 'package:space_app/features/authentication/logic/register_cubit/register_cubit.dart';
import 'package:space_app/features/authentication/ui/screens/widgets/user_data_section.dart';

class RegisterBody extends StatelessWidget {
  RegisterBody({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterErrorState) {
          showSnackBar(context, state.errMessage);
        } else if (state is RegistersSuccessState) {
          successRegisterShowDialog(context);
        }
      },
      builder: (context, state) {
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
                    letsTextKey,
                    style: AppTextStyles.fontWhite40W500,
                  ),
                  Text(
                    startTextKey,
                    style: AppTextStyles.fontWhite63W600,
                  ),
                  UserDataSection(
                    isLogin: false,
                    nameController: nameController,
                    emailController: emailController,
                    passwordController: passwordController,
                  ),
                  ConditionalBuilder(
                    condition: state is! RegisterLoadingState,
                    builder: (context) => CustomMaterialButton(
                      onPressed: () async {
                        await BlocProvider.of<RegisterCubit>(context)
                            .userRegistration(
                          name: nameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                        );
                      },
                      label: signUpTextKey,
                    ),
                    fallback: (context) => const CustomLoadingWidget(),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        termsAndConditionsTextKey,
                        style: AppTextStyles.fontWhite14W500WithUnderLine,
                      ),
                    ),
                  ),
                ]),
          ),
        );
      },
    );
  }
}
