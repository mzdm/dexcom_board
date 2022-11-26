// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StationModel _$StationModelFromJson(Map<String, dynamic> json) {
  return _StationModel.fromJson(json);
}

/// @nodoc
mixin _$StationModel {
  String get stationName => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StationModelCopyWith<StationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StationModelCopyWith<$Res> {
  factory $StationModelCopyWith(
          StationModel value, $Res Function(StationModel) then) =
      _$StationModelCopyWithImpl<$Res, StationModel>;
  @useResult
  $Res call({String stationName, String username, String password});
}

/// @nodoc
class _$StationModelCopyWithImpl<$Res, $Val extends StationModel>
    implements $StationModelCopyWith<$Res> {
  _$StationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stationName = null,
    Object? username = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      stationName: null == stationName
          ? _value.stationName
          : stationName // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StationModelCopyWith<$Res>
    implements $StationModelCopyWith<$Res> {
  factory _$$_StationModelCopyWith(
          _$_StationModel value, $Res Function(_$_StationModel) then) =
      __$$_StationModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String stationName, String username, String password});
}

/// @nodoc
class __$$_StationModelCopyWithImpl<$Res>
    extends _$StationModelCopyWithImpl<$Res, _$_StationModel>
    implements _$$_StationModelCopyWith<$Res> {
  __$$_StationModelCopyWithImpl(
      _$_StationModel _value, $Res Function(_$_StationModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stationName = null,
    Object? username = null,
    Object? password = null,
  }) {
    return _then(_$_StationModel(
      stationName: null == stationName
          ? _value.stationName
          : stationName // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StationModel extends _StationModel {
  const _$_StationModel(
      {required this.stationName,
      required this.username,
      required this.password})
      : super._();

  factory _$_StationModel.fromJson(Map<String, dynamic> json) =>
      _$$_StationModelFromJson(json);

  @override
  final String stationName;
  @override
  final String username;
  @override
  final String password;

  @override
  String toString() {
    return 'StationModel(stationName: $stationName, username: $username, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StationModel &&
            (identical(other.stationName, stationName) ||
                other.stationName == stationName) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, stationName, username, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StationModelCopyWith<_$_StationModel> get copyWith =>
      __$$_StationModelCopyWithImpl<_$_StationModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StationModelToJson(
      this,
    );
  }
}

abstract class _StationModel extends StationModel {
  const factory _StationModel(
      {required final String stationName,
      required final String username,
      required final String password}) = _$_StationModel;
  const _StationModel._() : super._();

  factory _StationModel.fromJson(Map<String, dynamic> json) =
      _$_StationModel.fromJson;

  @override
  String get stationName;
  @override
  String get username;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$_StationModelCopyWith<_$_StationModel> get copyWith =>
      throw _privateConstructorUsedError;
}
