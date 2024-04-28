import 'package:flutter/material.dart';

class LocalizationRepo {
  Locale? currentLocale;

  changeLocale(Locale locale) {
    currentLocale = locale;
  }

  isArabic() {
    return currentLocale?.languageCode == 'ar';
  }

}