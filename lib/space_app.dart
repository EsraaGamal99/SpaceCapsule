import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/features/localization/logic/localization_state.dart';

import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'features/localization/logic/localization_cubit.dart';
import 'features/localization/logic/translation_generated_logic/l10n.dart';

class SpaceApp extends StatelessWidget {
  final AppRouter appRouter;

  const SpaceApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: BlocBuilder<LocalizationCubit, LocalizationState>(
        builder: (context, state) {
          if(state is LocalaizationSuccess) {
            return MaterialApp(
              locale: state.data,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              debugShowCheckedModeBanner: false,
              onGenerateRoute: appRouter.generateRoute,
              initialRoute: Routes.homeScreen,
            );
          }
          return MaterialApp(
            locale: const Locale('en'),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: appRouter.generateRoute,
            initialRoute: Routes.homeScreen,
          );
        }
      ),
    );
  }
}
