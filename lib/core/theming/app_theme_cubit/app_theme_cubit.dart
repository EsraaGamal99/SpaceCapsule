import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:space_app/core/helpers/constants.dart';

import 'app_theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  final sharedPref;
  AppThemeCubit({ required this.sharedPref}) : super(AppThemeState.initial());

  static AppThemeCubit get(context) => BlocProvider.of<AppThemeCubit>(context);


  static ThemeMode themeMode = ThemeMode.system;


  Future<void> setAppTheme() async {
   await sharedPref.setBool(themeKey, isDarkMode);
  }

  Future<void> fetchAppTheme() async {
    try {
      final bool? isDarkModeFetched = await sharedPref.getBool(themeKey);

      isDarkModeFetched == null
          ? setInitialThemeMode()
          : themeMode = isDarkModeFetched ? ThemeMode.dark : ThemeMode.light;
      emit(AppThemeState.themeFetched());
      // Change Theme based on device theme or themeFetched
      changeTheme(themeMode);
    }catch(e){
      debugPrint(e.toString());
    }
  }

  final brightness = SchedulerBinding.instance.window.platformBrightness;

  bool get isInitialDarkMode => brightness == Brightness.dark;

  static bool isDarkMode = true;

  void setInitialThemeMode() {
    isInitialDarkMode
        ? themeMode = ThemeMode.dark
        : themeMode = ThemeMode.light;
  }
  changeTheme(ThemeMode theme){
    if(theme == ThemeMode.dark){
      isDarkMode = true;
      emit(AppThemeState.darkTheme());


    }
    else if(theme == ThemeMode.light){
      isDarkMode = false;
      emit(AppThemeState.lightTheme());
    }
    setAppTheme();
  }
  void toggleTheme({ required bool darkMode}) {
    themeMode = darkMode ? ThemeMode.dark : ThemeMode.light;
    changeTheme(themeMode);
  }
}
