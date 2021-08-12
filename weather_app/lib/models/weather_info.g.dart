// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherInfo _$WeatherInfoFromJson(Map<String, dynamic> json) => WeatherInfo(
      coord: json['coord'] == null
          ? null
          : Coord.fromJson(json['coord'] as Map<String, dynamic>),
      sys: json['sys'] == null
          ? null
          : Sys.fromJson(json['sys'] as Map<String, dynamic>),
      base: json['base'] as String?,
      visibility: json['visibility'] as int?,
      timezone: json['timezone'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$WeatherInfoToJson(WeatherInfo instance) =>
    <String, dynamic>{
      'coord': instance.coord?.toJson(),
      'sys': instance.sys?.toJson(),
      'base': instance.base,
      'visibility': instance.visibility,
      'timezone': instance.timezone,
      'name': instance.name,
    };
