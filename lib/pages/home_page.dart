import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/models/movie.dart';
import 'package:movies/pages/movie_detail_page.dart';
import 'package:movies/services/getter_service.dart';
import 'package:movies/widgets/margin_widget.dart';
import 'package:movies/widgets/navbar_widget.dart';

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
        body: SafeArea(
            child: Column(
      children: [
        const Navbar(),
        const VerticalMargin(20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Popular Movies",
                overflow: TextOverflow.clip,
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                )),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black26),
                    borderRadius: BorderRadius.circular(100)),
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  child: Text(
                    "See more",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: Colors.black26)),
                  ),
                ),
              )
            ],
          ),
        ),
        const VerticalMargin(40),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: SizedBox(
            height: 200,
            child: ListView.builder(
              itemCount: moviesCount,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => MovieDetail(movies[index])));
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 24),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Image.network(
                            "https://image.tmdb.org/t/p/original${movies[index].poster}",
                            width: MediaQuery.of(context).size.width * .30,
                          ),
                        ),
                        const HorizontalMargin(16),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(right: 4.0),
                                child: Text(
                                  movies[index].title,
                                  overflow: TextOverflow.clip,
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  )),
                                ),
                              ),
                              const VerticalMargin(8),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'lib/icons/Star.png',
                                    height: 14,
                                    color: Colors.yellow,
                                  ),
                                  const HorizontalMargin(4),
                                  Container(
                                    padding: const EdgeInsets.only(right: 4.0),
                                    child: Text(
                                      "${movies[index].voteAverage.round().toString()}/10 IMDb",
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black26,
                                        fontSize: 14,
                                      )),
                                    ),
                                  ),
                                ],
                              ),
                              const VerticalMargin(8),
                              Row(
                                children: [
                                  Image.asset(
                                    'lib/icons/Clock.png',
                                    width: 12,
                                    color: Colors.black,
                                  ),
                                  const HorizontalMargin(4),
                                  Text(
                                    "1h 43m",
                                    style: GoogleFonts.poppins(
                                        textStyle:
                                            const TextStyle(fontSize: 12)),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        )),
      ],
    )));
  }
}
