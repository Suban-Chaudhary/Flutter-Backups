import 'package:movie_app/models/movie.dart';
import 'package:movie_app/models/search_category.dart';

class MainPageData {
  List<Movie> movies;
  final int page;
  final String searchText;
  final String searchCategory;

  MainPageData({
    required this.movies,
    required this.page,
    required this.searchCategory,
    required this.searchText,
  });

  MainPageData.initial()
      : movies = [],
        page = 1,
        searchCategory = SearchCategory.popular,
        searchText = "";

  MainPageData copyWith(
      List<Movie> movies, int page, String searchText, String searchCategory) {
    return MainPageData(
        movies: movies,
        page: page,
        searchText: searchText,
        searchCategory: searchCategory);
  }
}
