import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobflix/home.dart';

void main() {
  runApp(const MobFlix());
}

class MobFlix extends StatelessWidget {
  const MobFlix({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFF222222),
          appBarTheme: AppBarTheme(
              color: const Color(0xFF1A1A1A),
              titleTextStyle: GoogleFonts.bebasNeue(
                  color: const Color(0xFF2478DF),
                  fontSize: 32,
                  fontWeight: FontWeight.bold))),
      home: const Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
