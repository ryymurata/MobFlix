import 'package:flutter/material.dart';

class FeaturedContent extends StatefulWidget {
  const FeaturedContent({super.key});

  @override
  State<FeaturedContent> createState() => _FeaturedContentState();
}

class _FeaturedContentState extends State<FeaturedContent> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.asset("images/Banner.png"),
        Positioned(
          bottom: 22,
          child: ElevatedButton(
            onPressed: () {},
            child: const Text(
              "Assista agora",
              style: TextStyle(fontSize: 18),
            ),
          ),
        )
      ],
    );
  }
}
