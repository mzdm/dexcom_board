// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'dexcom_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthorizeOptions _$AuthorizeOptionsFromJson(Map<String, dynamic> json) {
  return _AuthorizeOptions.fromJson(json);
}

/// @nodoc
mixin _$AuthorizeOptions {
  String? get applicationId => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get accountName => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthorizeOptionsCopyWith<AuthorizeOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthorizeOptionsCopyWith<$Res> {
  factory $AuthorizeOptionsCopyWith(
          AuthorizeOptions value, $Res Function(AuthorizeOptions) then) =
      _$AuthorizeOptionsCopyWithImpl<$Res, AuthorizeOptions>;
  @useResult
  $Res call(
      {String? applicationId,
      String? username,
      String? accountName,
      String? password});
}

/// @nodoc
class _$AuthorizeOptionsCopyWithImpl<$Res, $Val extends AuthorizeOptions>
    implements $AuthorizeOptionsCopyWith<$Res> {
  _$AuthorizeOptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? applicationId = freezed,
    Object? username = freezed,
    Object? accountName = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      applicationId: freezed == applicationId
          ? _value.applicationId
          : applicationId // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      accountName: freezed == accountName
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuthorizeOptionsCopyWith<$Res>
    implements $AuthorizeOptionsCopyWith<$Res> {
  factory _$$_AuthorizeOptionsCopyWith(
          _$_AuthorizeOptions value, $Res Function(_$_AuthorizeOptions) then) =
      __$$_AuthorizeOptionsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? applicationId,
      String? username,
      String? accountName,
      String? password});
}

/// @nodoc
class __$$_AuthorizeOptionsCopyWithImpl<$Res>
    extends _$AuthorizeOptionsCopyWithImpl<$Res, _$_AuthorizeOptions>
    implements _$$_AuthorizeOptionsCopyWith<$Res> {
  __$$_AuthorizeOptionsCopyWithImpl(
      _$_AuthorizeOptions _value, $Res Function(_$_AuthorizeOptions) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? applicationId = freezed,
    Object? username = freezed,
    Object? accountName = freezed,
    Object? password = freezed,
  }) {
    return _then(_$_AuthorizeOptions(
      applicationId: freezed == applicationId
          ? _value.applicationId
          : applicationId // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      accountName: freezed == accountName
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthorizeOptions extends _AuthorizeOptions {
  const _$_AuthorizeOptions(
      {this.applicationId, this.username, this.accountName, this.password})
      : super._();

  factory _$_AuthorizeOptions.fromJson(Map<String, dynamic> json) =>
      _$$_AuthorizeOptionsFromJson(json);

  @override
  final String? applicationId;
  @override
  final String? username;
  @override
  final String? accountName;
  @override
  final String? password;

  @override
  String toString() {
    return 'AuthorizeOptions(applicationId: $applicationId, username: $username, accountName: $accountName, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthorizeOptions &&
            (identical(other.applicationId, applicationId) ||
                other.applicationId == applicationId) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.accountName, accountName) ||
                other.accountName == accountName) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, applicationId, username, accountName, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthorizeOptionsCopyWith<_$_AuthorizeOptions> get copyWith =>
      __$$_AuthorizeOptionsCopyWithImpl<_$_AuthorizeOptions>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthorizeOptionsToJson(
      this,
    );
  }
}

abstract class _AuthorizeOptions extends AuthorizeOptions {
  const factory _AuthorizeOptions(
      {final String? applicationId,
      final String? username,
      final String? accountName,
      final String? password}) = _$_AuthorizeOptions;
  const _AuthorizeOptions._() : super._();

  factory _AuthorizeOptions.fromJson(Map<String, dynamic> json) =
      _$_AuthorizeOptions.fromJson;

  @override
  String? get applicationId;
  @override
  String? get username;
  @override
  String? get accountName;
  @override
  String? get password;
  @override
  @JsonKey(ignore: true)
  _$$_AuthorizeOptionsCopyWith<_$_AuthorizeOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

GetLatestReadingOptions _$GetLatestReadingOptionsFromJson(
    Map<String, dynamic> json) {
  return _GetLatestReadingOptions.fromJson(json);
}

/// @nodoc
mixin _$GetLatestReadingOptions {
  String get sessionId => throw _privateConstructorUsedError;
  String? get minutes => throw _privateConstructorUsedError;
  String? get maxCount => throw _privateConstructorUsedError;
  String? get outsideUs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetLatestReadingOptionsCopyWith<GetLatestReadingOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetLatestReadingOptionsCopyWith<$Res> {
  factory $GetLatestReadingOptionsCopyWith(GetLatestReadingOptions value,
          $Res Function(GetLatestReadingOptions) then) =
      _$GetLatestReadingOptionsCopyWithImpl<$Res, GetLatestReadingOptions>;
  @useResult
  $Res call(
      {String sessionId, String? minutes, String? maxCount, String? outsideUs});
}

/// @nodoc
class _$GetLatestReadingOptionsCopyWithImpl<$Res,
        $Val extends GetLatestReadingOptions>
    implements $GetLatestReadingOptionsCopyWith<$Res> {
  _$GetLatestReadingOptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? minutes = freezed,
    Object? maxCount = freezed,
    Object? outsideUs = freezed,
  }) {
    return _then(_value.copyWith(
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      minutes: freezed == minutes
          ? _value.minutes
          : minutes // ignore: cast_nullable_to_non_nullable
              as String?,
      maxCount: freezed == maxCount
          ? _value.maxCount
          : maxCount // ignore: cast_nullable_to_non_nullable
              as String?,
      outsideUs: freezed == outsideUs
          ? _value.outsideUs
          : outsideUs // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GetLatestReadingOptionsCopyWith<$Res>
    implements $GetLatestReadingOptionsCopyWith<$Res> {
  factory _$$_GetLatestReadingOptionsCopyWith(_$_GetLatestReadingOptions value,
          $Res Function(_$_GetLatestReadingOptions) then) =
      __$$_GetLatestReadingOptionsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String sessionId, String? minutes, String? maxCount, String? outsideUs});
}

/// @nodoc
class __$$_GetLatestReadingOptionsCopyWithImpl<$Res>
    extends _$GetLatestReadingOptionsCopyWithImpl<$Res,
        _$_GetLatestReadingOptions>
    implements _$$_GetLatestReadingOptionsCopyWith<$Res> {
  __$$_GetLatestReadingOptionsCopyWithImpl(_$_GetLatestReadingOptions _value,
      $Res Function(_$_GetLatestReadingOptions) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? minutes = freezed,
    Object? maxCount = freezed,
    Object? outsideUs = freezed,
  }) {
    return _then(_$_GetLatestReadingOptions(
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      minutes: freezed == minutes
          ? _value.minutes
          : minutes // ignore: cast_nullable_to_non_nullable
              as String?,
      maxCount: freezed == maxCount
          ? _value.maxCount
          : maxCount // ignore: cast_nullable_to_non_nullable
              as String?,
      outsideUs: freezed == outsideUs
          ? _value.outsideUs
          : outsideUs // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GetLatestReadingOptions extends _GetLatestReadingOptions {
  const _$_GetLatestReadingOptions(
      {required this.sessionId, this.minutes, this.maxCount, this.outsideUs})
      : super._();

  factory _$_GetLatestReadingOptions.fromJson(Map<String, dynamic> json) =>
      _$$_GetLatestReadingOptionsFromJson(json);

  @override
  final String sessionId;
  @override
  final String? minutes;
  @override
  final String? maxCount;
  @override
  final String? outsideUs;

  @override
  String toString() {
    return 'GetLatestReadingOptions(sessionId: $sessionId, minutes: $minutes, maxCount: $maxCount, outsideUs: $outsideUs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetLatestReadingOptions &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.minutes, minutes) || other.minutes == minutes) &&
            (identical(other.maxCount, maxCount) ||
                other.maxCount == maxCount) &&
            (identical(other.outsideUs, outsideUs) ||
                other.outsideUs == outsideUs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, sessionId, minutes, maxCount, outsideUs);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetLatestReadingOptionsCopyWith<_$_GetLatestReadingOptions>
      get copyWith =>
          __$$_GetLatestReadingOptionsCopyWithImpl<_$_GetLatestReadingOptions>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GetLatestReadingOptionsToJson(
      this,
    );
  }
}

abstract class _GetLatestReadingOptions extends GetLatestReadingOptions {
  const factory _GetLatestReadingOptions(
      {required final String sessionId,
      final String? minutes,
      final String? maxCount,
      final String? outsideUs}) = _$_GetLatestReadingOptions;
  const _GetLatestReadingOptions._() : super._();

  factory _GetLatestReadingOptions.fromJson(Map<String, dynamic> json) =
      _$_GetLatestReadingOptions.fromJson;

  @override
  String get sessionId;
  @override
  String? get minutes;
  @override
  String? get maxCount;
  @override
  String? get outsideUs;
  @override
  @JsonKey(ignore: true)
  _$$_GetLatestReadingOptionsCopyWith<_$_GetLatestReadingOptions>
      get copyWith => throw _privateConstructorUsedError;
}

ReadOptions _$ReadOptionsFromJson(Map<String, dynamic> json) {
  return _ReadOptions.fromJson(json);
}

/// @nodoc
mixin _$ReadOptions {
  String? get sessionId => throw _privateConstructorUsedError;
  int? get minutes => throw _privateConstructorUsedError;
  int? get maxCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReadOptionsCopyWith<ReadOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReadOptionsCopyWith<$Res> {
  factory $ReadOptionsCopyWith(
          ReadOptions value, $Res Function(ReadOptions) then) =
      _$ReadOptionsCopyWithImpl<$Res, ReadOptions>;
  @useResult
  $Res call({String? sessionId, int? minutes, int? maxCount});
}

/// @nodoc
class _$ReadOptionsCopyWithImpl<$Res, $Val extends ReadOptions>
    implements $ReadOptionsCopyWith<$Res> {
  _$ReadOptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = freezed,
    Object? minutes = freezed,
    Object? maxCount = freezed,
  }) {
    return _then(_value.copyWith(
      sessionId: freezed == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String?,
      minutes: freezed == minutes
          ? _value.minutes
          : minutes // ignore: cast_nullable_to_non_nullable
              as int?,
      maxCount: freezed == maxCount
          ? _value.maxCount
          : maxCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReadOptionsCopyWith<$Res>
    implements $ReadOptionsCopyWith<$Res> {
  factory _$$_ReadOptionsCopyWith(
          _$_ReadOptions value, $Res Function(_$_ReadOptions) then) =
      __$$_ReadOptionsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? sessionId, int? minutes, int? maxCount});
}

/// @nodoc
class __$$_ReadOptionsCopyWithImpl<$Res>
    extends _$ReadOptionsCopyWithImpl<$Res, _$_ReadOptions>
    implements _$$_ReadOptionsCopyWith<$Res> {
  __$$_ReadOptionsCopyWithImpl(
      _$_ReadOptions _value, $Res Function(_$_ReadOptions) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = freezed,
    Object? minutes = freezed,
    Object? maxCount = freezed,
  }) {
    return _then(_$_ReadOptions(
      sessionId: freezed == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String?,
      minutes: freezed == minutes
          ? _value.minutes
          : minutes // ignore: cast_nullable_to_non_nullable
              as int?,
      maxCount: freezed == maxCount
          ? _value.maxCount
          : maxCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReadOptions extends _ReadOptions {
  const _$_ReadOptions({this.sessionId, this.minutes, this.maxCount})
      : super._();

  factory _$_ReadOptions.fromJson(Map<String, dynamic> json) =>
      _$$_ReadOptionsFromJson(json);

  @override
  final String? sessionId;
  @override
  final int? minutes;
  @override
  final int? maxCount;

  @override
  String toString() {
    return 'ReadOptions(sessionId: $sessionId, minutes: $minutes, maxCount: $maxCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReadOptions &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.minutes, minutes) || other.minutes == minutes) &&
            (identical(other.maxCount, maxCount) ||
                other.maxCount == maxCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, sessionId, minutes, maxCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReadOptionsCopyWith<_$_ReadOptions> get copyWith =>
      __$$_ReadOptionsCopyWithImpl<_$_ReadOptions>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReadOptionsToJson(
      this,
    );
  }
}

abstract class _ReadOptions extends ReadOptions {
  const factory _ReadOptions(
      {final String? sessionId,
      final int? minutes,
      final int? maxCount}) = _$_ReadOptions;
  const _ReadOptions._() : super._();

  factory _ReadOptions.fromJson(Map<String, dynamic> json) =
      _$_ReadOptions.fromJson;

  @override
  String? get sessionId;
  @override
  int? get minutes;
  @override
  int? get maxCount;
  @override
  @JsonKey(ignore: true)
  _$$_ReadOptionsCopyWith<_$_ReadOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

GlucoseEventRecord _$GlucoseEventRecordFromJson(Map<String, dynamic> json) {
  return _GlucoseEventRecord.fromJson(json);
}

/// @nodoc
mixin _$GlucoseEventRecord {
  String? get DT => throw _privateConstructorUsedError;
  String? get ST => throw _privateConstructorUsedError;
  Trend? get trend => throw _privateConstructorUsedError;
  num? get value => throw _privateConstructorUsedError;
  String? get WT => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GlucoseEventRecordCopyWith<GlucoseEventRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GlucoseEventRecordCopyWith<$Res> {
  factory $GlucoseEventRecordCopyWith(
          GlucoseEventRecord value, $Res Function(GlucoseEventRecord) then) =
      _$GlucoseEventRecordCopyWithImpl<$Res, GlucoseEventRecord>;
  @useResult
  $Res call(
      {String? DT,
      String? ST,
      Trend? trend,
      num? value,
      String? WT,
      DateTime? date});
}

/// @nodoc
class _$GlucoseEventRecordCopyWithImpl<$Res, $Val extends GlucoseEventRecord>
    implements $GlucoseEventRecordCopyWith<$Res> {
  _$GlucoseEventRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? DT = freezed,
    Object? ST = freezed,
    Object? trend = freezed,
    Object? value = freezed,
    Object? WT = freezed,
    Object? date = freezed,
  }) {
    return _then(_value.copyWith(
      DT: freezed == DT
          ? _value.DT
          : DT // ignore: cast_nullable_to_non_nullable
              as String?,
      ST: freezed == ST
          ? _value.ST
          : ST // ignore: cast_nullable_to_non_nullable
              as String?,
      trend: freezed == trend
          ? _value.trend
          : trend // ignore: cast_nullable_to_non_nullable
              as Trend?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as num?,
      WT: freezed == WT
          ? _value.WT
          : WT // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GlucoseEventRecordCopyWith<$Res>
    implements $GlucoseEventRecordCopyWith<$Res> {
  factory _$$_GlucoseEventRecordCopyWith(_$_GlucoseEventRecord value,
          $Res Function(_$_GlucoseEventRecord) then) =
      __$$_GlucoseEventRecordCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? DT,
      String? ST,
      Trend? trend,
      num? value,
      String? WT,
      DateTime? date});
}

/// @nodoc
class __$$_GlucoseEventRecordCopyWithImpl<$Res>
    extends _$GlucoseEventRecordCopyWithImpl<$Res, _$_GlucoseEventRecord>
    implements _$$_GlucoseEventRecordCopyWith<$Res> {
  __$$_GlucoseEventRecordCopyWithImpl(
      _$_GlucoseEventRecord _value, $Res Function(_$_GlucoseEventRecord) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? DT = freezed,
    Object? ST = freezed,
    Object? trend = freezed,
    Object? value = freezed,
    Object? WT = freezed,
    Object? date = freezed,
  }) {
    return _then(_$_GlucoseEventRecord(
      DT: freezed == DT
          ? _value.DT
          : DT // ignore: cast_nullable_to_non_nullable
              as String?,
      ST: freezed == ST
          ? _value.ST
          : ST // ignore: cast_nullable_to_non_nullable
              as String?,
      trend: freezed == trend
          ? _value.trend
          : trend // ignore: cast_nullable_to_non_nullable
              as Trend?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as num?,
      WT: freezed == WT
          ? _value.WT
          : WT // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GlucoseEventRecord extends _GlucoseEventRecord {
  const _$_GlucoseEventRecord(
      {this.DT, this.ST, this.trend, this.value, this.WT, this.date})
      : super._();

  factory _$_GlucoseEventRecord.fromJson(Map<String, dynamic> json) =>
      _$$_GlucoseEventRecordFromJson(json);

  @override
  final String? DT;
  @override
  final String? ST;
  @override
  final Trend? trend;
  @override
  final num? value;
  @override
  final String? WT;
  @override
  final DateTime? date;

  @override
  String toString() {
    return 'GlucoseEventRecord(DT: $DT, ST: $ST, trend: $trend, value: $value, WT: $WT, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GlucoseEventRecord &&
            (identical(other.DT, DT) || other.DT == DT) &&
            (identical(other.ST, ST) || other.ST == ST) &&
            (identical(other.trend, trend) || other.trend == trend) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.WT, WT) || other.WT == WT) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, DT, ST, trend, value, WT, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GlucoseEventRecordCopyWith<_$_GlucoseEventRecord> get copyWith =>
      __$$_GlucoseEventRecordCopyWithImpl<_$_GlucoseEventRecord>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GlucoseEventRecordToJson(
      this,
    );
  }
}

abstract class _GlucoseEventRecord extends GlucoseEventRecord {
  const factory _GlucoseEventRecord(
      {final String? DT,
      final String? ST,
      final Trend? trend,
      final num? value,
      final String? WT,
      final DateTime? date}) = _$_GlucoseEventRecord;
  const _GlucoseEventRecord._() : super._();

  factory _GlucoseEventRecord.fromJson(Map<String, dynamic> json) =
      _$_GlucoseEventRecord.fromJson;

  @override
  String? get DT;
  @override
  String? get ST;
  @override
  Trend? get trend;
  @override
  num? get value;
  @override
  String? get WT;
  @override
  DateTime? get date;
  @override
  @JsonKey(ignore: true)
  _$$_GlucoseEventRecordCopyWith<_$_GlucoseEventRecord> get copyWith =>
      throw _privateConstructorUsedError;
}
