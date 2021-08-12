// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherInfo _$WeatherInfoFromJson(Map json) => WeatherInfo(
      coord:
          json['coord'] == null ? null : Coord.fromJson(json['coord'] as Map),
      base: json['base'] as String?,
      visibility: json['visibility'] as int?,
      timezone: json['timezone'] as int?,
      name: json['name'] as String?,
    );

Map _$WeatherInfoToJson(WeatherInfo instance) => {
      'coord': instance.coord?.toJson(),
      'base': instance.base,
      'visibility': instance.visibility,
      'timezone': instance.timezone,
      'name': instance.name,
    };
