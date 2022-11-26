// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StationModel _$$_StationModelFromJson(Map<String, dynamic> json) =>
    _$_StationModel(
      stationName: json['stationName'] as String,
      username: json['username'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$$_StationModelToJson(_$_StationModel instance) =>
    <String, dynamic>{
      'stationName': instance.stationName,
      'username': instance.username,
      'password': instance.password,
    };

_$_GlucoseListEventRecords _$$_GlucoseListEventRecordsFromJson(
        Map<String, dynamic> json) =>
    _$_GlucoseListEventRecords(
      eventRecords: const GlucoseEventRecordListConverter()
          .fromJson(json['eventRecords'] as String),
    );

Map<String, dynamic> _$$_GlucoseListEventRecordsToJson(
        _$_GlucoseListEventRecords instance) =>
    <String, dynamic>{
      'eventRecords':
          const GlucoseEventRecordListConverter().toJson(instance.eventRecords),
    };
