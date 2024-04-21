import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repos/localization_repo.dart';
import 'localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit() : super(const LocalizationState.initial());

  final LocalizationRepo _localizationRepo = LocalizationRepo();

  //Todo: Cashing the locale
  void changeLocale(Locale locale) {
    emit(const LocalizationState.loading());
    _localizationRepo.changeLocale(locale);
    emit(LocalizationState.success(locale));
  }

  bool isArabic() {
    return _localizationRepo.isArabic();
  }

}
