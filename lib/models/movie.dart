class Movie {
  int id;
  String title;
  double voteAverage;
  String overview;
  String poster;
  DateTime releaseDate;

  Movie(this.id, this.title, this.voteAverage, this.overview, this.poster,
      this.releaseDate);

  factory Movie.fromJson(Map<String, dynamic> parsedJson) {
    return Movie(
        parsedJson['id'],
        parsedJson['title'],
        parsedJson['vote_average'] * 1.0,
        parsedJson['overview'],
        parsedJson['poster_path'],
        DateTime.parse(parsedJson['release_date']));
  }
}
