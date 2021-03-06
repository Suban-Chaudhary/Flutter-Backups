import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/services/http_service.dart';

class MovieService {
  GetIt getIt = GetIt.instance;
  HTTPSerivce? _http;

  MovieService() {
    _http = getIt.get<HTTPSerivce>();
  }

  Future<List<Movie>> getPopularMovies({int? page}) async {
    Response _response = await _http!.get("/movie/popular", query: {
      "page": page,
    });
    if (_response.statusCode == 200) {
      Map _data = _response.data;
      List<Movie> _movies = _data["results"].map<Movie>((_movieData) {
        return Movie.fromJson(_movieData);
      }).toList();
      return _movies;
    } else {
      throw Exception("Could not load the data");
    }
  }

  Future<List<Movie>> getUpcomingMovies({int? page}) async {
    Response _response = await _http!.get("/movie/upcoming", query: {
      "page": page,
    });
    if (_response.statusCode == 200) {
      Map _data = _response.data;
      List<Movie> _movies = _data["results"].map<Movie>((_movieData) {
        return Movie.fromJson(_movieData);
      }).toList();
      return _movies;
    } else {
      throw Exception("Could not load the data");
    }
  }

  Future<List<Movie>> searchMovies(String _searchTerm, {int? page}) async {
    Response _response = await _http!.get("/search/movie", query: {
      "query": _searchTerm,
      "page": page,
    });
    if (_response.statusCode == 200) {
      Map _data = _response.data;
      List<Movie> _movies = _data["results"].map<Movie>((_movieData) {
        return Movie.fromJson(_movieData);
      }).toList();
      return _movies;
    } else {
      throw Exception("Could not perform the movie search.");
    }
  }
}
