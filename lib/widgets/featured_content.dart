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
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2478DF),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
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
