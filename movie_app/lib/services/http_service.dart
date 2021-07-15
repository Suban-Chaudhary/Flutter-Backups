import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/models/app_config.dart';

class HTTPSerivce {
  final GetIt getIt = GetIt.instance;
  final Dio dio = Dio();
  String? _base_api_url;
  String? _api_key;

  HTTPSerivce() {
    AppConfig _config = getIt.get<AppConfig>();
    _base_api_url = _config.BASE_API_URL;
    _api_key = _config.API_KEY;
  }

  Future<Response> get(String path, {Map<String, dynamic>? query}) async {
    try {
      final url = "$_base_api_url$path";
      Map<String, dynamic> _query = {
        "language": "en-US",
        "api_key": _api_key,
      };
      if (query != null) {
        _query.addAll(query);
      }
      return await dio.get(url, queryParameters: _query);
    } on DioError catch (e) {
      print("Could not get the data");
      throw Exception("Dio Error $e");
    }
  }
}
