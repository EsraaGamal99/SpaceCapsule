


import 'package:freezed_annotation/freezed_annotation.dart';
part 'internet_checker_state.freezed.dart';

@freezed
class InternetCheckerState<T> with _$InternetCheckerState<T>{
  const factory InternetCheckerState.initial() = _Initial;
  const factory InternetCheckerState.connected() = Connected;
  const factory InternetCheckerState.notConnected() = NotConnected;
}
