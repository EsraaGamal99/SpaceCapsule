import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/core/helpers/constants.dart';
import 'package:space_app/core/theming/app_theme_cubit/app_theme_cubit.dart';
import 'package:space_app/core/theming/app_themes.dart';
import 'package:space_app/features/localization/logic/localization_cubit.dart';
import 'package:space_app/features/localization/logic/localization_state.dart';
import 'package:space_app/generated/l10n.dart';

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
                    statusBarIconBrightness: AppThemeCubit.isDarkMode
                        ? Brightness.light
                        : Brightness.dark,
                  ),
                );
                return ScreenUtilInit(
                  designSize: const Size(375, 812),
                  minTextAdapt: true,
                  child: BlocBuilder<LocalizationCubit, LocalizationState>(
                      builder: (context, state) {
                        return MaterialApp(
                          locale: state is LocalaizationSuccess ? state.data : englishLocale,
                          localizationsDelegates: const [
                            S.delegate,
                            GlobalMaterialLocalizations.delegate,
                            GlobalWidgetsLocalizations.delegate,
                            GlobalCupertinoLocalizations.delegate,
                          ],
                          themeMode: AppThemeCubit.themeMode,
                          darkTheme: AppThemes.darkTheme,
                          theme:  AppThemes.lightTheme,

                          supportedLocales: S.delegate.supportedLocales,
                          debugShowCheckedModeBanner: false,
                          onGenerateRoute: appRouter.generateRoute,
                          initialRoute: Routes.splashScreen,
                        );
                      }
                  ),
                );
            }
          ),
    );
  }
}