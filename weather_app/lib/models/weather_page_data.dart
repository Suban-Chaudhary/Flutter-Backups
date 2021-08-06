import 'package:weather_app/models/weather.dart';

class WeatherPageData {
  WeatherInfo? weatherInfo;
  final String searchText;

  WeatherPageData({
    required this.searchText,
    required this.weatherInfo,
  });

  WeatherPageData.initial() : searchText = "";

  WeatherPageData copyWith(
      {required WeatherInfo? weatherInfo, required String searchText}) {
    return WeatherPageData(weatherInfo: weatherInfo, searchText: searchText);
  }
}
