import 'package:get_it/get_it.dart';
import 'package:movie_app/services/http_service.dart';

class MovieService {
  GetIt getIt = GetIt.instance;
  HTTPSerivce? _http;

  MovieService() {
    _http = getIt.get<HTTPSerivce>();
  }
}
