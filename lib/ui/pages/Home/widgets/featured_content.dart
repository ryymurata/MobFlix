import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FeaturedContent extends StatelessWidget {
  const FeaturedContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.asset("images/Banner.png"),
        Positioned(
          bottom: 22,
          child: ElevatedButton(
            onPressed: () =>
                _launchUrl("https://www.youtube.com/watch?v=N3h5A0oAzsk"),
            child: const Text(
              "Assista agora",
              style: TextStyle(fontSize: 18),
            ),
          ),
        )
      ],
    );
  }

  _launchUrl(String link) async {
    final Uri url = Uri.parse(link);

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }
}
