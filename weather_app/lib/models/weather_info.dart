import 'package:json_annotation/json_annotation.dart';

import 'coord.dart';
part 'weather_info.g.dart';

@JsonSerializable(explicitToJson: true)
class WeatherInfo {
  // List<Weather>? weather;
  Coord? coord;
  // Sys? sys;
  // Main? main;
  String? base;
  int? visibility;
  int? timezone;
  String? name;

  WeatherInfo({
    // this.weather,
    this.coord,
    // this.sys,
    // this.main,
    this.base,
    this.visibility,
    this.timezone,
    this.name,
  });

  factory WeatherInfo.fromJson(Map json) => _$WeatherInfoFromJson(json);
  Map toJson() => _$WeatherInfoToJson(this);

//   factory WeatherInfo.fromJson(Map json) {
//     return WeatherInfo(
//       // weather: json["weather"]
//       // coord: Coord.fromJson(json["coord"]),
//       // sys: json["sys"],
//       // main: json["main"],
//       base: json["base"],
//       visibility: json["visibility"],
//       timezone: json["timezone"],
//       name: json["name"],
//     );
//   }
// }

}
