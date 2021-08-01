import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/services/http_service.dart';

class WeatherSerivce {
  GetIt getIt = GetIt.instance;
  Dio dio = Dio();
  HTTPService? http;
  WeatherSerivce() {
    http = getIt.get<HTTPService>();
  }

  Future<WeatherInfo> getWeatherInfo({String? cityName}) async {
    Response _response = await dio.get("/weather", queryParameters: {
      "id": cityName,
    });
    if (_response.statusCode == 200) {
      Map _data = _response.data;
      return WeatherInfo.fromJson(_data);
    } else {
      throw Exception("Could not load the data");
    }
  }
}
