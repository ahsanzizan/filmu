import 'dart:convert';

import 'package:movies/models/movie.dart';
import './http_service.dart';

class Getter {
  Future<List<Movie>> getPopularMovies() async {
    HttpService httpService = HttpService();
    final getPopularMovies = await httpService.get('/popular');
    final parsePopularMovies = jsonDecode(getPopularMovies);
    final popularMovies = parsePopularMovies['results'];
    final List<Movie> movies =
        List<Movie>.from(popularMovies.map((movie) => Movie.fromJson(movie)));

    return movies;
  }
}
