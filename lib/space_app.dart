import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/core/theming/app_theme_cubit/app_theme_cubit.dart';
import 'package:space_app/features/localization/logic/localization_cubit.dart';
import 'package:space_app/features/localization/logic/localization_state.dart';
import 'package:space_app/features/localization/logic/translation_generated/l10n.dart';

import 'core/di/dependency_injection.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/theming/app_theme_cubit/app_theme_state.dart';

class SpaceApp extends StatelessWidget {
  final AppRouter appRouter;
  const SpaceApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
        BlocProvider<AppThemeCubit>(
        create: (context) => getIt<AppThemeCubit>()..fetchAppTheme(),
          ),
        ],
          child: BlocBuilder<AppThemeCubit, AppThemeState>(
              builder: (context, state) {
                SystemChrome.setSystemUIOverlayStyle(
                  SystemUiOverlayStyle(
                    statusBarColor: Colors.transparent,
                    statusBarIconBrightness: AppThemeCubit.get(context).isDarkMode
                        ? Brightness.light
                        : Brightness.dark,
                  ),
                );
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
                            initialRoute: Routes.splashScreen,
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
                          initialRoute: Routes.registerScreen,
                        );
                      }
                  ),
                );
            }
          ),
    );
  }
}