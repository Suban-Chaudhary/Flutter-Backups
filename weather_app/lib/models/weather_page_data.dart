import 'package:weather_app/models/weather_info.dart';

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
          coord: Coord(lat: 0, lon: 0),
        );

  WeatherPageData copyWith(
      {required WeatherInfo? weatherInfo, required String searchText}) {
    return WeatherPageData(weatherInfo: weatherInfo, searchText: searchText);
  }
}
