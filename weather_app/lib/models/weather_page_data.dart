import 'package:weather_app/models/weather_info.dart';

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
          name: 0,
          base: "",
          timezone: 0,
          visibility: 0,
        );

  WeatherPageData copyWith(
      {required WeatherInfo? weatherInfo, required String searchText}) {
    return WeatherPageData(weatherInfo: weatherInfo, searchText: searchText);
  }
}
