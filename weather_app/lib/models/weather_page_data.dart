import 'package:weather_app/models/sys.dart';
import 'package:weather_app/models/temperature.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/models/weather_info.dart';
import 'package:weather_app/models/wind.dart';

import 'coord.dart';

class WeatherPageData {
  WeatherInfo? weatherInfo;
  final String searchText;

  WeatherPageData({
    required this.searchText,
    required this.weatherInfo,
  });

  WeatherPageData.initial()
      : searchText = "",
        weatherInfo = WeatherInfo(
          name: "",
          base: "",
          timezone: null,
          visibility: null,
          coord: Coord(),
          temp: Temperature(),
          sys: Sys(),
          weather: [],
          wind: Wind(),
        );

  WeatherPageData copyWith(
      {required WeatherInfo? weatherInfo, required String searchText}) {
    return WeatherPageData(weatherInfo: weatherInfo, searchText: searchText);
  }
}
