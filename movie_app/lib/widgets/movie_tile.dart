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
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _moviePosterWidget(movie!.posterUrl()),
          _movieInfoWidget(),
        ],
      ),
    );
  }

  Widget _moviePosterWidget(String _imageUrl) {
    return Container(
      height: height,
      width: width! * 0.3,
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(_imageUrl)),
      ),
    );
  }

  Widget _movieInfoWidget() {
    return Container(
      height: height,
      width: width! * 0.66,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: width! * 0.56,
                child: Text(
                  movie!.name,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 22,
                  ),
                ),
              ),
              Text(
                movie!.rating.toString(),
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(right: height! * 0.02),
            child: Text(
              "${movie!.language.toString().toUpperCase()} ${movie!.isAdult} ${movie!.releaseDate}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: height! * 0.07),
            child: Text(
              "${movie!.description}",
              maxLines: 9,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.white70, fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }
}
