import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/helpers/bloc_observer.dart';
import 'package:space_app/core/di/dependency_injection.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:space_app/core/routing/app_router.dart';
import 'package:space_app/space_app.dart';
import 'features/localization/logic/localization_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  //Initial local data (Hive)
  await Hive.initFlutter();
  /// dependancy injection
  await setupGetIt();

  runApp(
    BlocProvider(
      create: (context) => getIt<LocalizationCubit>(),
      child: SpaceApp(appRouter: AppRouter()),
    ),
  );
}
