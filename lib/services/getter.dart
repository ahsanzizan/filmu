import 'package:movies/models/movie.dart';
import './http_service.dart';

class Getter {
  Future<List<Movie>> getPopularMovies() async {
    HttpService httpService = HttpService();
    final popularMovies = await httpService.get('/popular');
    return popularMovies;
  }
}
