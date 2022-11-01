import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobflix/models/video.dart';
import 'package:mobflix/provider/video_provider.dart';
import 'package:mobflix/ui/pages/Home/home.dart';
import 'package:mobflix/ui/pages/VideoForm/video_form.dart';
import 'package:mobflix/ui/pages/VideosByCategory/videos_by_category.dart';

void main() {
  List<Video> videos = [];
  runApp(VideoProvider(videos: videos, child: const MobFlix()));
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
                fontWeight: FontWeight.bold)),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFF275FA3),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          hintStyle: const TextStyle(color: Color(0xFFB0B0B0), fontSize: 16),
        ),
      ),
      routes: {
        '/': (context) => const Home(),
        '/registerVideo': (context) => const VideoForm(),
        '/videosByCategory': (context) => const VideosByCategory()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
