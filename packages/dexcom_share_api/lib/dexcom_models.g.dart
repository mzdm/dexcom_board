// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dexcom_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthorizeOptions _$$_AuthorizeOptionsFromJson(Map<String, dynamic> json) =>
    _$_AuthorizeOptions(
      applicationId: json['applicationId'] as String?,
      username: json['username'] as String?,
      accountName: json['accountName'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$$_AuthorizeOptionsToJson(_$_AuthorizeOptions instance) =>
    <String, dynamic>{
      'applicationId': instance.applicationId,
      'username': instance.username,
      'accountName': instance.accountName,
      'password': instance.password,
    };

_$_GetLatestReadingOptions _$$_GetLatestReadingOptionsFromJson(
        Map<String, dynamic> json) =>
    _$_GetLatestReadingOptions(
      sessionId: json['sessionId'] as String,
      minutes: json['minutes'] as String?,
      maxCount: json['maxCount'] as String?,
      outsideUs: json['outsideUs'] as String?,
    );

Map<String, dynamic> _$$_GetLatestReadingOptionsToJson(
        _$_GetLatestReadingOptions instance) =>
    <String, dynamic>{
      'sessionId': instance.sessionId,
      'minutes': instance.minutes,
      'maxCount': instance.maxCount,
      'outsideUs': instance.outsideUs,
    };

_$_ReadOptions _$$_ReadOptionsFromJson(Map<String, dynamic> json) =>
    _$_ReadOptions(
      sessionId: json['sessionId'] as String?,
      minutes: json['minutes'] as int?,
      maxCount: json['maxCount'] as int?,
    );

Map<String, dynamic> _$$_ReadOptionsToJson(_$_ReadOptions instance) =>
    <String, dynamic>{
      'sessionId': instance.sessionId,
      'minutes': instance.minutes,
      'maxCount': instance.maxCount,
    };

_$_GlucoseEventRecord _$$_GlucoseEventRecordFromJson(
        Map<String, dynamic> json) =>
    _$_GlucoseEventRecord(
      DT: json['DT'] as String?,
      ST: json['ST'] as String?,
      trend: $enumDecodeNullable(_$TrendEnumMap, json['trend']),
      value: json['value'] as num?,
      WT: json['WT'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$_GlucoseEventRecordToJson(
        _$_GlucoseEventRecord instance) =>
    <String, dynamic>{
      'DT': instance.DT,
      'ST': instance.ST,
      'trend': _$TrendEnumMap[instance.trend],
      'value': instance.value,
      'WT': instance.WT,
      'date': instance.date?.toIso8601String(),
    };

const _$TrendEnumMap = {
  Trend.none: 'none',
  Trend.doubleUp: 'doubleUp',
  Trend.singleUp: 'singleUp',
  Trend.fortyFiveUp: 'fortyFiveUp',
  Trend.flat: 'flat',
  Trend.fortyFiveDown: 'fortyFiveDown',
  Trend.singleDown: 'singleDown',
  Trend.doubleDown: 'doubleDown',
  Trend.notComputable: 'notComputable',
  Trend.outOfRange: 'outOfRange',
};
