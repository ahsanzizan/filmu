import 'package:flutter/material.dart';
import 'package:movies/models/movie.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;
  const MovieDetail(this.movie, {super.key});

  @override
  Widget build(BuildContext context) {
    String poster = movie.poster;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          title: Text(movie.title),
          backgroundColor: Colors.white,
          foregroundColor: Colors.blue[400],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                    padding: const EdgeInsets.all(16),
                    height: height / 1.5,
                    child: Image.network(
                      "https://image.tmdb.org/t/p/original$poster",
                      width: MediaQuery.of(context).size.width,
                    )),
                Container(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Text(movie.overview))
              ],
            ),
          ),
        ));
  }
}
