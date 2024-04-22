import 'package:freezed_annotation/freezed_annotation.dart';
part 'app_theme_state.freezed.dart';

@freezed
class AppThemeState<T> with _$AppThemeState<T>{
  const factory AppThemeState.initial() = _Initial;

  const factory AppThemeState.lightTheme() = LightTheme;
  const factory AppThemeState.darkTheme() = DarkTheme;
  const factory AppThemeState.themeFetched() = ThemeFetched;

}