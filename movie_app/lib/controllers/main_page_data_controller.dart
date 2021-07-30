import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/models/main_page_data.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/models/search_category.dart';
import 'package:movie_app/services/movie_service.dart';

class MainPageDataController extends StateNotifier<MainPageData> {
  MainPageDataController([MainPageData? state])
      : super(state ?? MainPageData.initial()) {
    getMovies();
  }
  final MovieService _movieService = GetIt.instance.get<MovieService>();

  Future<void> getMovies() async {
    try {
      List<Movie> _movies = [];
      if (state.searchText.isEmpty) {
        if (state.searchCategory == SearchCategory.popular) {
          _movies = await _movieService.getPopularMovies(page: state.page);
        } else if (state.searchCategory == SearchCategory.upcoming) {
          _movies = await _movieService.getUpcomingMovies(page: state.page);
        } else if (state.searchCategory == SearchCategory.none) {
          _movies = [];
        }
      } else {
        _movies = await _movieService.searchMovies(state.searchText);
      }
      state = state.copyWith([...state.movies, ..._movies], state.page + 1,
          state.searchText, state.searchCategory);
    } catch (e) {
      print(e);
    }
  }

  void updateSearchCategory(String _searchCategory) {
    try {
      state = state.copyWith([], 1, state.searchText, _searchCategory);
      getMovies();
    } catch (e) {
      print(e);
    }
  }

  void updateTextString(String _searchText) {
    try {
      state = state.copyWith([], 1, _searchText, SearchCategory.none);
      getMovies();
    } catch (e) {
      print(e);
    }
  }
}
