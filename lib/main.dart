import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/core/routing/app_router.dart';
import 'package:space_app/space_app.dart';

import 'core/di/dependency_injection.dart';
import 'core/helpers/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  /// dependancy injection
  await setupGetIt();

  runApp(SpaceApp(appRouter: AppRouter()));
}
