// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shrine_cetner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_shrineCenter _$$_shrineCenterFromJson(Map<String, dynamic> json) =>
    _$_shrineCenter(
      explanation: json['explanation'] as String,
      godID: json['godID'] as String,
      hiraName: json['hiraName'] as String,
      name: json['name'] as String,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      imageName: json['imageName'] as String,
    );

Map<String, dynamic> _$$_shrineCenterToJson(_$_shrineCenter instance) =>
    <String, dynamic>{
      'explanation': instance.explanation,
      'godID': instance.godID,
      'hiraName': instance.hiraName,
      'name': instance.name,
      'lat': instance.lat,
      'lng': instance.lng,
      'imageName': instance.imageName,
    };
