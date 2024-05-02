import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:space_app/core/helpers/constants.dart';
import 'package:space_app/features/localization/logic/localization_cubit.dart';


gerCurrentLanguageLocale(BuildContext context) {
  Locale language = BlocProvider.of<LocalizationCubit>(context).getLocale();
  return language;
}


Future<String> getCurrentLanguageName(BuildContext context) async {
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String? localCode = sharedPreferences.getString(localeKey);
  switch (localCode) {
    case 'ar':
      return 'العربية';
    case 'en':
      return 'English';
    default:
      return 'English';
  }
}