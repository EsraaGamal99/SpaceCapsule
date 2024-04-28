import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/features/authentication/data/auth_repo.dart';
import 'package:space_app/features/authentication/logic/login_cubit/login_cubit.dart';
import 'package:space_app/features/authentication/ui/screens/widgets/login_body.dart';
import 'package:space_app/features/authentication/ui/screens/widgets/scaffold_for_authentication.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldForAuthentication(
      body: BlocProvider(
        create: (context) => LoginCubit(AuthRepo()),
        child: LoginBody(),
      ),
    );
  }
}
