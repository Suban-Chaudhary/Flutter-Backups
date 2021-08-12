import 'package:json_annotation/json_annotation.dart';
part 'temperature.g.dart';

@JsonSerializable()
class Temperature {
  double? temp;
  double? feelsLike;
  double? minTemp;
  double? maxTemp;
  int? pressure;
  int? humidity;

  Temperature({
    this.temp,
    this.feelsLike,
    this.minTemp,
    this.maxTemp,
    this.pressure,
    this.humidity,
  });

  factory Temperature.fromJson(Map<String, dynamic> json) =>
      _$TemperatureFromJson(json);
  Map<String, dynamic> toJson() => _$TemperatureToJson(this);
}
