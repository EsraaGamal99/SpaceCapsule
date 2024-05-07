import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:space_app/core/helpers/constants.dart';

import '../data/repos/localization_repo.dart';
import 'localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit() : super(const LocalizationState.initial()) {
    // Initialize cubit and load saved locale from shared preferences
    _localizationRepo.getSavedLocale().then((_) {
      emit(LocalizationState.success(_localizationRepo.getLocale()));
    });
  }
  final LocalizationRepo _localizationRepo = LocalizationRepo();

  getLocale() async {
    return _localizationRepo.getLocale();
  }

  void changeLocale(Locale locale) {
    emit(const LocalizationState.loading());
    _localizationRepo.changeLocale(locale);
    emit(LocalizationState.success(locale));
  }

  bool isArabic() {
    return _localizationRepo.isArabic();
  }

}
