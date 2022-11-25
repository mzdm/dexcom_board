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
    // String? DT,
    // String? ST,
    FutureTrend? Trend,
    int? Value,
    @ValueDateTimeConverter() DateTime? WT,
  }) = _GlucoseEventRecord;

  const GlucoseEventRecord._();

  factory GlucoseEventRecord.fromJson(Map<String, Object?> json) =>
      _$GlucoseEventRecordFromJson(json);
}

enum FutureTrend {
  None,
  DoubleUp,
  SingleUp,
  FortyFiveUp,
  Flat,
  FortyFiveDown,
  SingleDown,
  DoubleDown,
  NotComputable,
  OutOfRange;

  String get description {
    switch (this) {
      case FutureTrend.None:
        return "";
      case FutureTrend.DoubleUp:
        return "rising quickly";
      case FutureTrend.SingleUp:
        return "rising";
      case FutureTrend.FortyFiveUp:
        return "rising slightly";
      case FutureTrend.Flat:
        return "steady";
      case FutureTrend.FortyFiveDown:
        return "falling slightly";
      case FutureTrend.SingleDown:
        return "falling";
      case FutureTrend.DoubleDown:
        return "falling quickly";
      case FutureTrend.NotComputable:
        return "unable to determine trend";
      case FutureTrend.OutOfRange:
        return "trend unavailable";
    }
  }
}

class ValueDateTimeConverter implements JsonConverter<DateTime?, String> {
  const ValueDateTimeConverter();

  @override
  DateTime? fromJson(String json) {
    final parsed = int.tryParse(json.replaceAll(RegExp('[^0-9]'), ''));
    if (parsed == null) {
      return null;
    }
    return DateTime.fromMillisecondsSinceEpoch(parsed);
  }

  @override
  String toJson(DateTime? v) {
    return v?.toIso8601String() ?? '';
  }
}
