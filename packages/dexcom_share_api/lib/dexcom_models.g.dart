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
      Trend: $enumDecodeNullable(_$FutureTrendEnumMap, json['Trend']),
      Value: json['Value'] as int?,
      WT: _$JsonConverterFromJson<String, DateTime?>(
          json['WT'], const ValueDateTimeConverter().fromJson),
    );

Map<String, dynamic> _$$_GlucoseEventRecordToJson(
        _$_GlucoseEventRecord instance) =>
    <String, dynamic>{
      'Trend': _$FutureTrendEnumMap[instance.Trend],
      'Value': instance.Value,
      'WT': const ValueDateTimeConverter().toJson(instance.WT),
    };

const _$FutureTrendEnumMap = {
  FutureTrend.None: 'None',
  FutureTrend.DoubleUp: 'DoubleUp',
  FutureTrend.SingleUp: 'SingleUp',
  FutureTrend.FortyFiveUp: 'FortyFiveUp',
  FutureTrend.Flat: 'Flat',
  FutureTrend.FortyFiveDown: 'FortyFiveDown',
  FutureTrend.SingleDown: 'SingleDown',
  FutureTrend.DoubleDown: 'DoubleDown',
  FutureTrend.NotComputable: 'NotComputable',
  FutureTrend.OutOfRange: 'OutOfRange',
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
