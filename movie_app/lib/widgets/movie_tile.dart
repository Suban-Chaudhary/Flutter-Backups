import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';

class MovieTile extends StatelessWidget {
  final double? height;
  final double? width;
  final Movie? movie;
  const MovieTile({Key? key, this.height, this.width, this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
