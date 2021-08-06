import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/models/weather_page_data.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherPageDataController extends StateNotifier<WeatherPageData> {
  WeatherPageDataController([WeatherPageData? state])
      : super(state ?? WeatherPageData.initial()) {
    getWeather();
  }

  final WeatherService weatherService = GetIt.instance.get<WeatherService>();

  Future<void> getWeather() async {
    try {
      WeatherInfo weatherInfo =
          await weatherService.getWeatherInfo(cityName: state.searchText);
      state = state.copyWith(
          weatherInfo: weatherInfo, searchText: state.searchText);
    } catch (e) {
      print(e);
    }
  }

  void updateTextString(String _searchText) {
    try {
      state = state.copyWith(
          weatherInfo: state.weatherInfo, searchText: _searchText);
      getWeather();
    } catch (e) {
      print(e);
    }
  }
}
