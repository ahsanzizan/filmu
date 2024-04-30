import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/models/movie.dart';
import 'package:movies/widgets/margin_widget.dart';
import 'package:movies/widgets/navbar_widget.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;
  const MovieDetail(this.movie, {super.key});

  @override
  Widget build(BuildContext context) {
    String poster = movie.poster;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Navbar(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.width / 20),
                      child: Image.network(
                        "https://image.tmdb.org/t/p/original$poster",
                        width: MediaQuery.of(context).size.width,
                        height: height / 1.5,
                      )),
                ),
                Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: Text(
                                movie.title,
                                overflow: TextOverflow.clip,
                                textAlign: TextAlign.left,
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.bookmark_add,
                            size: 24,
                          )
                        ]),
                    const VerticalMargin(4),
                    Row(
                      children: [
                        Image.asset(
                          'lib/icons/Star.png',
                          height: 14,
                          color: Colors.yellow,
                        ),
                        const HorizontalMargin(4),
                        Text(
                          "${movie.voteAverage.round().toString()}/10 IMDb",
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black26,
                            fontSize: 14,
                          )),
                        ),
                      ],
                    ),
                    const VerticalMargin(16),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Length",
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontSize: 16, color: Colors.black38)),
                            ),
                            Text(
                              "1h 42min",
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(fontSize: 16)),
                            ),
                          ],
                        ),
                        const HorizontalMargin(24),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Language",
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontSize: 16, color: Colors.black38)),
                            ),
                            Text(
                              "English",
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(fontSize: 16)),
                            ),
                          ],
                        ),
                        const HorizontalMargin(24),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Rating",
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontSize: 16, color: Colors.black38)),
                            ),
                            Text(
                              "PG-13",
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(fontSize: 16)),
                            ),
                          ],
                        )
                      ],
                    ),
                    const VerticalMargin(20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Overview",
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                        ),
                        const VerticalMargin(8),
                        Text(
                          movie.overview,
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(fontSize: 14)),
                        ),
                      ],
                    ),
                    const VerticalMargin(32),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
