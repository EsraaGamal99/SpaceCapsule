import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/helpers/bloc_observer.dart';
import 'package:space_app/core/di/dependency_injection.dart';
import 'package:space_app/core/routing/app_router.dart';
import 'package:space_app/space_app.dart';

import 'features/localization/logic/localization_cubit.dart';

void main() async {
  await initGetIt();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  runApp(
    BlocProvider(
      create: (context) => getIt<LocalizationCubit>(),
      child: SpaceApp(appRouter: AppRouter()),
    ),
  );
}
