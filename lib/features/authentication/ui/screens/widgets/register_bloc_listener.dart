import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:space_app/features/authentication/logic/register_cubit/register_cubit.dart';
import 'package:space_app/features/authentication/logic/register_cubit/register_state.dart';
import '../../../../../core/helpers/functions/show_snack_bar.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/assets.dart';

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
            showDialog(
              context: context,
              builder: (context) => Center(
                child: Lottie.asset(AppAssets.meditationForLoading),
              ),
            );
          },
          success: (success) async {
            await Future.delayed(Duration(seconds: 2));
            Navigator.pop(context);
            Navigator.pushNamed(context, Routes.loginScreen);
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
