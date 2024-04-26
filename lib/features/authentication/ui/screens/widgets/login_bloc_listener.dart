import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../../../../../core/helpers/functions/show_snack_bar.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/assets.dart';
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
            showDialog(
              context: context,
              builder: (context) => Center(
                child: Lottie.asset(AppAssets.meditationForLoading),
              ),
            );
          },
          success: (success) async {
            await Future.delayed(const Duration(seconds: 2));
            Navigator.pop(context);
            Navigator.pushReplacementNamed(context, Routes.homeScreen);
          },
          error: (error) async {
            await Future.delayed(const Duration(seconds: 2));
            Navigator.pop(context);
            showSnackBar(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
