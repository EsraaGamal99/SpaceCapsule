import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:space_app/features/landpods/data/models/landpod_model.dart';
part 'landpod_state.freezed.dart';

@freezed
abstract class LandpodState with _$LandpodState {
  const factory LandpodState.initial() = _Initial;
  const factory LandpodState.loading() = Loading;
  const factory LandpodState.loaded(List<LandpodModel> landpods) = Loaded;
  const factory LandpodState.error(String message) = Error;
}
