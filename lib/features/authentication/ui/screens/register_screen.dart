import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/features/authentication/logic/register_cubit/register_cubit.dart';
import 'package:space_app/features/authentication/ui/screens/widgets/register_body.dart';
import 'package:space_app/features/authentication/ui/screens/widgets/scaffold_for_authentication.dart';

import '../../../../core/di/dependency_injection.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldForAuthentication(
      body: BlocProvider(
        create: (context) => getIt<RegisterCubit>(),
        child: const RegisterBody(),
      ),
    );
  }
}