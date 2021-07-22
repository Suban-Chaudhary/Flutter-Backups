import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/models/search_category.dart';
import 'package:movie_app/widgets/movie_tile.dart';

class MainPage extends ConsumerWidget {
  late double _deviceHeight;
  late double _deviceWidth;
  TextEditingController _searchTextFieldController = TextEditingController();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return _buildUI();
  }

  Widget _buildUI() {
    return Scaffold(
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
    );
  }

  Widget _backgroundWidget() {
    return Container(
      height: _deviceHeight,
      width: _deviceWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
              "https://images.unsplash.com/photo-1542038784456-1ea8e935640e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cGhvdG9ncmFwaHl8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80"),
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
  }

  Widget _foregroundWidget() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, _deviceHeight * 0.02, 0, 0),
      width: _deviceWidth * 0.88,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _topBarWidget(),
          Container(
            height: _deviceHeight * 0.9,
            padding: EdgeInsets.symmetric(vertical: _deviceHeight * 0.01),
            child: _moviesListViewWidget(),
          ),
        ],
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
        onSubmitted: (_input) {},
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10.0),
          focusedBorder: _border,
          border: _border,
          prefix: Icon(Icons.search, color: Colors.white24),
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
      value: SearchCategory.popular,
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
      onChanged: (_value) {},
    );
  }

  Widget _moviesListViewWidget() {
    List<Movie> _movies = [];
    for (var i = 0; i < 20; i++) {
      _movies.add(
        Movie(
          name: "Hello World",
          backdropPath: "/dq18nCTTLpy9PmtzZI6Y2yAgdw5.jpg",
          language: "EN",
          description:
              "Hello world is the tutorial movie for every programmers and everyone start their journery from hello world only Quis anim nulla elit ad ad. Aliquip fugiat aliquip laborum tempor ex eu id nulla consectetur exercitation aliqua et. Ad officia non ut deserunt voluptate ex commodo Lorem id sit esse velit. Mollit nisi aute ut nostrud laborum. Do esse dolor officia velit pariatur pariatur minim commodo do veniam.",
          isAdult: false,
          rating: 4.7,
          releaseDate: "2021/01/21",
          posterPath: "/qAZ0pzat24kLdO3o8ejmbLxyOac.jpg",
        ),
      );
    }
    if (_movies.length != 0) {
      return ListView.builder(
        itemCount: _movies.length,
        itemBuilder: (BuildContext _context, int _count) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: _deviceHeight * 0.01),
            child: GestureDetector(
              onTap: () => {},
              child: MovieTile(
                width: _deviceWidth * 0.85,
                height: _deviceHeight * 0.20,
                movie: _movies[_count],
              ),
            ),
          );
        },
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
