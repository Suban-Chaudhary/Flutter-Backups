import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/models/app_config.dart';

class HTTPService {
  GetIt getIt = GetIt.instance;
  Dio dio = Dio();
  String? apiKey;
  String? baseApiUrl;
  HTTPService() {
    AppConfig _appConfig = getIt.get<AppConfig>();
    apiKey = _appConfig.apiKey;
    baseApiUrl = _appConfig.baseApiUrl;
  }

  Future<Response> get(String path, {Map<String, dynamic>? query}) async {
    try {
      final url = "$baseApiUrl$path";
      Map<String, dynamic> _query = {
        "appid": apiKey,
      };
      if (query != null) {
        _query.addAll(query);
      }
      return await dio.get(url, queryParameters: _query);
    } on DioError catch (e) {
      throw Exception("Error: ${e.toString()}");
    }
  }
}
