import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/core/di/dependency_injection.dart';
import 'package:space_app/core/routing/app_router.dart';
import 'package:space_app/space_app.dart';

import 'features/localization/logic/localization_cubit.dart';

void main() async {
  await initGetIt();
  runApp(
    BlocProvider(
      create: (context) => getIt<LocalizationCubit>(),
      child: SpaceApp(appRouter: AppRouter()),
    ),
  );
}