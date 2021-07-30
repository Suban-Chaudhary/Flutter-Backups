import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/controllers/main_page_data_controller.dart';
import 'package:movie_app/models/main_page_data.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/models/search_category.dart';
import 'package:movie_app/widgets/movie_tile.dart';

final mainPageDataControllerProvider =
    StateNotifierProvider<MainPageDataController, MainPageData>((ref) {
  return MainPageDataController();
});

final selectedMoviePosterURLProvider = StateProvider<String>((ref) {
  final _movies = ref.watch(mainPageDataControllerProvider).movies;
  return _movies.length != 0 ? _movies[0].posterUrl() : "";
});

class MainPage extends ConsumerWidget {
  late double _deviceHeight;
  late double _deviceWidth;
  TextEditingController _searchTextFieldController = TextEditingController();
  late MainPageDataController _mainPageDataController;
  late MainPageData _mainPageData;
  var _selectedMoviePosterURL;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    _mainPageDataController = watch(mainPageDataControllerProvider.notifier);
    _mainPageData = watch(mainPageDataControllerProvider);
    _searchTextFieldController.text = _mainPageData.searchText;
    _selectedMoviePosterURL = watch(selectedMoviePosterURLProvider);
    return _buildUI();
  }

  Widget _buildUI() {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: _deviceHeight,
          width: _deviceWidth,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              _backgroundWidget(),
              _foregroundWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _backgroundWidget() {
    if (_selectedMoviePosterURL.state != "") {
      return Container(
        height: _deviceHeight,
        width: _deviceWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(_selectedMoviePosterURL.state),
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
            ),
          ),
        ),
      );
    } else {
      return Container(
        height: _deviceHeight,
        width: _deviceWidth,
        color: Colors.black,
      );
    }
  }

  Widget _foregroundWidget() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.fromLTRB(0, _deviceHeight * 0.02, 0, 0),
        width: _deviceWidth * 0.88,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _topBarWidget(),
            Container(
              height: _deviceHeight * 0.85,
              padding: EdgeInsets.symmetric(vertical: _deviceHeight * 0.01),
              child: _moviesListViewWidget(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _topBarWidget() {
    return Container(
      height: _deviceHeight * 0.06,
      decoration: BoxDecoration(
        color: Colors.black45,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _searchFieldWidget(),
          _categorySelectionWidget(),
        ],
      ),
    );
  }

  Widget _searchFieldWidget() {
    final _border = InputBorder.none;
    return Container(
      width: _deviceWidth * 0.5,
      height: _deviceHeight * 0.05,
      child: TextField(
        controller: _searchTextFieldController,
        onSubmitted: (_input) =>
            _mainPageDataController.updateTextString(_input),
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          focusedBorder: _border,
          border: _border,
          hintStyle: TextStyle(color: Colors.white54),
          filled: false,
          fillColor: Colors.white24,
          hintText: "Search..",
        ),
      ),
    );
  }

  Widget _categorySelectionWidget() {
    return DropdownButton(
      dropdownColor: Colors.black38,
      value: _mainPageData.searchCategory,
      icon: Icon(
        Icons.menu,
        color: Colors.white24,
      ),
      items: [
        DropdownMenuItem(
          child: Text(
            SearchCategory.popular,
            style: TextStyle(color: Colors.white),
          ),
          value: SearchCategory.popular,
        ),
        DropdownMenuItem(
          child: Text(
            SearchCategory.upcoming,
            style: TextStyle(color: Colors.white),
          ),
          value: SearchCategory.upcoming,
        ),
        DropdownMenuItem(
          child: Text(
            SearchCategory.none,
            style: TextStyle(color: Colors.white),
          ),
          value: SearchCategory.none,
        ),
      ],
      underline: Container(
        height: 1,
        color: Colors.white24,
      ),
      onChanged: (_value) {
        _value.toString().isNotEmpty
            ? _mainPageDataController.updateSearchCategory(_value.toString())
            : null;
      },
    );
  }

  Widget _moviesListViewWidget() {
    List<Movie> _movies = _mainPageData.movies;
    if (_movies.length != 0) {
      return NotificationListener(
        onNotification: (notification) {
          if (notification is ScrollNotification) {
            final before = notification.metrics.extentBefore;
            final max = notification.metrics.maxScrollExtent;
            if (before == max) {
              _mainPageDataController.getMovies();
              return true;
            }
            return false;
          }
          return false;
        },
        child: ListView.builder(
          itemCount: _movies.length,
          itemBuilder: (BuildContext _context, int _count) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: _deviceHeight * 0.01),
              child: GestureDetector(
                onTap: () => {
                  _selectedMoviePosterURL.state = _movies[_count].posterUrl(),
                },
                child: MovieTile(
                  width: _deviceWidth * 0.85,
                  height: _deviceHeight * 0.20,
                  movie: _movies[_count],
                ),
              ),
            );
          },
        ),
      );
    } else {
      return Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
        ),
      );
    }
  }
}
