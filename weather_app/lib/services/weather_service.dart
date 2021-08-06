import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/services/http_service.dart';

class WeatherService {
  GetIt getIt = GetIt.instance;
  HTTPService? http;
  WeatherService() {
    http = getIt.get<HTTPService>();
  }

  Future<WeatherInfo> getWeatherInfo({String? cityName}) async {
    Response _response = await http!.get("/weather", query: {
      "id": "Kathmandu",
    });
    if (_response.statusCode == 200) {
      Map _data = _response.data;
      print(WeatherInfo.fromJson(_data));
      return WeatherInfo.fromJson(_data);
    } else {
      throw Exception("Could not load the data");
    }
  }
}
