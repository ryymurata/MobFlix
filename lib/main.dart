import 'package:flutter/material.dart';
import 'package:mobflix/home.dart';

void main() {
  runApp(const MobFlix());
}

class MobFlix extends StatelessWidget {
  const MobFlix({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
