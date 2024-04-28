import 'package:get_it/get_it.dart';

import '../../features/localization/data/repos/localization_repo.dart';
import '../../features/localization/logic/localization_cubit.dart';

final GetIt getIt = GetIt.instance;

Future<void> initGetIt() async {
  getIt.registerSingleton<LocalizationRepo>(LocalizationRepo());
  getIt.registerSingleton<LocalizationCubit>(LocalizationCubit());
}