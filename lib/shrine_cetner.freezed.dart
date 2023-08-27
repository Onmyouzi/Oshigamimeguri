// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shrine_cetner.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

shrineCenter _$shrineCenterFromJson(Map<String, dynamic> json) {
  return _shrineCenter.fromJson(json);
}

/// @nodoc
mixin _$shrineCenter {
  String get explanation => throw _privateConstructorUsedError;
  String get godID => throw _privateConstructorUsedError;
  String get hiraName => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get lat => throw _privateConstructorUsedError;
  double get lng => throw _privateConstructorUsedError;
  String get imageName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $shrineCenterCopyWith<shrineCenter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $shrineCenterCopyWith<$Res> {
  factory $shrineCenterCopyWith(
          shrineCenter value, $Res Function(shrineCenter) then) =
      _$shrineCenterCopyWithImpl<$Res, shrineCenter>;
  @useResult
  $Res call(
      {String explanation,
      String godID,
      String hiraName,
      String name,
      double lat,
      double lng,
      String imageName});
}

/// @nodoc
class _$shrineCenterCopyWithImpl<$Res, $Val extends shrineCenter>
    implements $shrineCenterCopyWith<$Res> {
  _$shrineCenterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? explanation = null,
    Object? godID = null,
    Object? hiraName = null,
    Object? name = null,
    Object? lat = null,
    Object? lng = null,
    Object? imageName = null,
  }) {
    return _then(_value.copyWith(
      explanation: null == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String,
      godID: null == godID
          ? _value.godID
          : godID // ignore: cast_nullable_to_non_nullable
              as String,
      hiraName: null == hiraName
          ? _value.hiraName
          : hiraName // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
      imageName: null == imageName
          ? _value.imageName
          : imageName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_shrineCenterCopyWith<$Res>
    implements $shrineCenterCopyWith<$Res> {
  factory _$$_shrineCenterCopyWith(
          _$_shrineCenter value, $Res Function(_$_shrineCenter) then) =
      __$$_shrineCenterCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String explanation,
      String godID,
      String hiraName,
      String name,
      double lat,
      double lng,
      String imageName});
}

/// @nodoc
class __$$_shrineCenterCopyWithImpl<$Res>
    extends _$shrineCenterCopyWithImpl<$Res, _$_shrineCenter>
    implements _$$_shrineCenterCopyWith<$Res> {
  __$$_shrineCenterCopyWithImpl(
      _$_shrineCenter _value, $Res Function(_$_shrineCenter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? explanation = null,
    Object? godID = null,
    Object? hiraName = null,
    Object? name = null,
    Object? lat = null,
    Object? lng = null,
    Object? imageName = null,
  }) {
    return _then(_$_shrineCenter(
      explanation: null == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String,
      godID: null == godID
          ? _value.godID
          : godID // ignore: cast_nullable_to_non_nullable
              as String,
      hiraName: null == hiraName
          ? _value.hiraName
          : hiraName // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
      imageName: null == imageName
          ? _value.imageName
          : imageName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_shrineCenter with DiagnosticableTreeMixin implements _shrineCenter {
  const _$_shrineCenter(
      {required this.explanation,
      required this.godID,
      required this.hiraName,
      required this.name,
      required this.lat,
      required this.lng,
      required this.imageName});

  factory _$_shrineCenter.fromJson(Map<String, dynamic> json) =>
      _$$_shrineCenterFromJson(json);

  @override
  final String explanation;
  @override
  final String godID;
  @override
  final String hiraName;
  @override
  final String name;
  @override
  final double lat;
  @override
  final double lng;
  @override
  final String imageName;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'shrineCenter(explanation: $explanation, godID: $godID, hiraName: $hiraName, name: $name, lat: $lat, lng: $lng, imageName: $imageName)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'shrineCenter'))
      ..add(DiagnosticsProperty('explanation', explanation))
      ..add(DiagnosticsProperty('godID', godID))
      ..add(DiagnosticsProperty('hiraName', hiraName))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('lat', lat))
      ..add(DiagnosticsProperty('lng', lng))
      ..add(DiagnosticsProperty('imageName', imageName));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_shrineCenter &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation) &&
            (identical(other.godID, godID) || other.godID == godID) &&
            (identical(other.hiraName, hiraName) ||
                other.hiraName == hiraName) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng) &&
            (identical(other.imageName, imageName) ||
                other.imageName == imageName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, explanation, godID, hiraName, name, lat, lng, imageName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_shrineCenterCopyWith<_$_shrineCenter> get copyWith =>
      __$$_shrineCenterCopyWithImpl<_$_shrineCenter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_shrineCenterToJson(
      this,
    );
  }
}

abstract class _shrineCenter implements shrineCenter {
  const factory _shrineCenter(
      {required final String explanation,
      required final String godID,
      required final String hiraName,
      required final String name,
      required final double lat,
      required final double lng,
      required final String imageName}) = _$_shrineCenter;

  factory _shrineCenter.fromJson(Map<String, dynamic> json) =
      _$_shrineCenter.fromJson;

  @override
  String get explanation;
  @override
  String get godID;
  @override
  String get hiraName;
  @override
  String get name;
  @override
  double get lat;
  @override
  double get lng;
  @override
  String get imageName;
  @override
  @JsonKey(ignore: true)
  _$$_shrineCenterCopyWith<_$_shrineCenter> get copyWith =>
      throw _privateConstructorUsedError;
}
