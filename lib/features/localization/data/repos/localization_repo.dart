import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:space_app/core/helpers/constants.dart';

class LocalizationRepo {
  Locale? currentLocale;

  Future<void> getSavedLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final localeCode = prefs.getString(localeKey);
    if (localeCode != null) {
      currentLocale = Locale(localeCode);
    }
    print('LocalizationRepo localeCode $localeCode');
  }

  Future<void> changeLocale(Locale locale) async {
    currentLocale = locale;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(localeKey, locale.languageCode);
  }

  Locale getLocale() {
    return currentLocale ?? englishLocale;
  }

  // changeLocale(Locale locale) {
  //   currentLocale = locale;
  // }

  isArabic() {
    return currentLocale?.languageCode == arabicLocale.languageCode;
  }

}