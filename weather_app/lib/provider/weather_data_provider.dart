import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/controllers/weather_page_data_controller.dart';
import 'package:weather_app/models/weather_page_data.dart';

final weatherPageDataControllerProvider =
    StateNotifierProvider<WeatherPageDataController, WeatherPageData>((ref) {
  return WeatherPageDataController();
});
