import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'shrine_cetner.freezed.dart';
part 'shrine_cetner.g.dart';

@freezed
class shrineCenter with _$shrineCenter {
  const factory shrineCenter({
    required String explanation,
    required String godID,
    required String hiraName,
    required String name,
    required double lat,
    required double lng,
    required String imageName,
  }) = _shrineCenter;

  factory shrineCenter.fromJson(Map<String, dynamic> json) =>
      _$shrineCenterFromJson(json);
}
