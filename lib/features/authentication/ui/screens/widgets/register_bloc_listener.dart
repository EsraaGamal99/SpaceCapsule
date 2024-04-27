import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/core/helpers/functions/auth_laoding_dialog.dart';
import 'package:space_app/core/helpers/functions/wait_then_pop_and_navigate.dart';
import 'package:space_app/features/authentication/logic/register_cubit/register_cubit.dart';
import 'package:space_app/features/authentication/logic/register_cubit/register_state.dart';
import '../../../../../core/helpers/functions/show_snack_bar.dart';
import '../../../../../core/routing/routes.dart';

class RegisterBlocListener extends StatelessWidget {
  const RegisterBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listenWhen: (previous, current) =>
      current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            authLoadingDialog(context);
          },
          success: (success)  async {
           await waitThenPopAndNavigate(context,Routes.loginScreen);
          },
          error: (error)  async {
            await waitThenPopAndNavigate(context,null);
            if (!context.mounted) return;
            showSnackBar(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

}
