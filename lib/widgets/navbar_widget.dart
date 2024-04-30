import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'lib/icons/Menu.png',
            height: 42,
            color: Colors.indigoAccent[300],
          ),
          Text(
            "Filmu",
            style: GoogleFonts.merriweather(
                textStyle:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.w800)),
          ),
          Icon(
            Icons.person,
            size: 42,
            color: Colors.indigoAccent[300],
          ),
        ],
      ),
    );
  }
}
