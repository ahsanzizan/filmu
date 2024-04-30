import 'package:flutter/material.dart';
import 'package:movies/models/movie.dart';
import 'package:movies/pages/movie_detail.dart';
import 'package:movies/services/getter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int moviesCount = 0;
  List<Movie> movies = [];
  Getter getter = Getter();

  Future<void> initialize() async {
    movies = await getter.getPopularMovies();
    setState(() {
      moviesCount = movies.length;
    });
  }

  @override
  void initState() {
    super.initState();
    getter = Getter();
    initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Popular Movies"),
          backgroundColor: Colors.blueGrey[400],
          foregroundColor: Colors.white,
        ),
        body: ListView.builder(
          itemCount: moviesCount,
          itemBuilder: (context, index) {
            return Card(
                color: Colors.white,
                elevation: 1.0,
                child: ListTile(
                  leading: Image(
                    image: NetworkImage(
                      "https://image.tmdb.org/t/p/original${movies[index].poster}",
                    ),
                  ),
                  title: Text(movies[index].title),
                  subtitle: Text(movies[index].overview),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => MovieDetail(movies[index])));
                  },
                ));
          },
        ));
  }
}
