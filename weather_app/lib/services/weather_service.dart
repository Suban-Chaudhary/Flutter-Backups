import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/models/weather_info.dart';
import 'package:weather_app/services/http_service.dart';

class WeatherService {
  GetIt getIt = GetIt.instance;
  HTTPService? http;
  WeatherService() {
    http = getIt.get<HTTPService>();
  }

  Future<WeatherInfo> getWeatherInfo({String? cityName}) async {
    Response _response = await http!.get("/weather", query: {
      "q": cityName,
    });
    if (_response.statusCode == 200) {
      Map<String, dynamic> _data = await _response.data;
      print(_data);
      final weatherinfo = WeatherInfo.fromJson(_data);
      print(weatherinfo.name);

      return WeatherInfo.fromJson(_data);
    } else {
      throw Exception("Could not load the data");
    }
  }
}
