import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/core/helpers/functions/auth_laoding_dialog.dart';
import 'package:space_app/core/helpers/functions/wait_then_pop_and_navigate.dart';
import '../../../../../core/helpers/functions/show_snack_bar.dart';
import '../../../../../core/routing/routes.dart';
import '../../../logic/login_cubit/login_cubit.dart';
import '../../../logic/login_cubit/login_state.dart';

class LogInBlocListener extends StatelessWidget {
  const LogInBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LogInState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            authLoadingDialog(context);
          },
          success: (success) async {
            await waitThenPopAndNavigate(context, Routes.homeScreen);
          },
          error: (error) async {
            await waitThenPopAndNavigate(context, null);
            if (!context.mounted) return;
            showSnackBar(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
