import 'package:freezed_annotation/freezed_annotation.dart';

part 'dexcom_models.freezed.dart';

part 'dexcom_models.g.dart';

@freezed
class AuthorizeOptions with _$AuthorizeOptions {
  const factory AuthorizeOptions({
    String? applicationId,
    String? username,
    String? accountName,
    String? password,
  }) = _AuthorizeOptions;

  const AuthorizeOptions._();

  factory AuthorizeOptions.fromJson(Map<String, Object?> json) => _$AuthorizeOptionsFromJson(json);
}

@freezed
class GetLatestReadingOptions with _$GetLatestReadingOptions {
  const factory GetLatestReadingOptions({
    required String sessionId,
    String? minutes,
    String? maxCount,
    String? outsideUs,
  }) = _GetLatestReadingOptions;

  const GetLatestReadingOptions._();

  factory GetLatestReadingOptions.fromJson(Map<String, Object?> json) =>
      _$GetLatestReadingOptionsFromJson(json);
}

@freezed
class ReadOptions with _$ReadOptions {
  const factory ReadOptions({
    String? sessionId,
    int? minutes,
    int? maxCount,
  }) = _ReadOptions;

  const ReadOptions._();

  factory ReadOptions.fromJson(Map<String, Object?> json) => _$ReadOptionsFromJson(json);
}

@freezed
class GlucoseEventRecord with _$GlucoseEventRecord {
  const factory GlucoseEventRecord({
    String? DT,
    String? ST,
    Trend? trend,
    num? value,
    String? WT,
    DateTime? date,
  }) = _GlucoseEventRecord;

  const GlucoseEventRecord._();

  factory GlucoseEventRecord.fromJson(Map<String, Object?> json) =>
      _$GlucoseEventRecordFromJson(json);
}

enum Trend {
  none,
  doubleUp,
  singleUp,
  fortyFiveUp,
  flat,
  fortyFiveDown,
  singleDown,
  doubleDown,
  notComputable,
  outOfRange;

  String get description {
    switch (this) {
      case Trend.none:
        return "";
      case Trend.doubleUp:
        return "rising quickly";
      case Trend.singleUp:
        return "rising";
      case Trend.fortyFiveUp:
        return "rising slightly";
      case Trend.flat:
        return "steady";
      case Trend.fortyFiveDown:
        return "falling slightly";
      case Trend.singleDown:
        return "falling";
      case Trend.doubleDown:
        return "falling quickly";
      case Trend.notComputable:
        return "unable to determine trend";
      case Trend.outOfRange:
        return "trend unavailable";
    }
  }
}
