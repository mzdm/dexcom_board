import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_models.freezed.dart';
part 'app_models.g.dart';

@freezed
class StationModel with _$StationModel {
  const factory StationModel({
    required String stationName,
    required String username,
    required String password,
  }) = _StationModel;

  const StationModel._();

  factory StationModel.fromJson(Map<String, Object?> json) => _$StationModelFromJson(json);
}
