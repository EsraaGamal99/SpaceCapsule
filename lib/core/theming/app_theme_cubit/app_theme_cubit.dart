import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:space_app/core/helpers/constants.dart';

import 'app_theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  final Box themeBox;
  AppThemeCubit({ required this.themeBox}) : super(AppThemeState.initial());

  static AppThemeCubit get(context) => BlocProvider.of<AppThemeCubit>(context);


  ThemeMode themeMode = ThemeMode.system;

  Future<void> setAppTheme() async {
    await themeBox.add(isDarkMode);
  }

  Future<void> fetchAppTheme() async {
    final bool? isDarkModeFetched = await themeBox.get(themeKey);
    isDarkModeFetched == null
        ? setInitialThemeMode()
        : themeMode = isDarkModeFetched ? ThemeMode.dark : ThemeMode.light;
    emit(AppThemeState.themeFetched());
  }

  final brightness = SchedulerBinding.instance.window.platformBrightness;

  bool get isInitialDarkMode => brightness == Brightness.dark;

  bool isDarkMode = false;

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
  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    changeTheme(themeMode);
  }
}
