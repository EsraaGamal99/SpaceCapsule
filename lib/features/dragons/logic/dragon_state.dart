
import 'package:freezed_annotation/freezed_annotation.dart';
part 'dragon_state.freezed.dart';

@freezed
class DragonState<T> with _$DragonState<T>{
  const factory DragonState.initial() = _Initial;

  const factory DragonState.loading() = Loading;
  const factory DragonState.success(T data) = Success<T>;
  const factory DragonState.error({required String error}) = Error;
  // const factory DragonState.isConnected() = IsConnected;
  const factory DragonState.internetConnectionFaild() = InternetConnectionFaild;
}