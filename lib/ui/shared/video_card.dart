import 'package:flutter/material.dart';
import 'package:mobflix/models/video.dart';
import 'package:mobflix/ui/shared/category_tag.dart';
import 'package:url_launcher/url_launcher.dart';

class VideoCard extends StatelessWidget {
  final Video video;
  const VideoCard({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategoryTag(categoryName: video.videoCategory!),
          GestureDetector(
            onTap: () =>
                _launchUrl("https://www.youtube.com/watch?v=${video.videoId}"),
            child: Container(
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  )
                ]),
                child: Image.network(video.videoThumbnailUrl!)),
          ),
          const SizedBox(height: 18)
        ],
      ),
    );
  }

  _launchUrl(String link) async {
    final Uri url = Uri.parse(link);

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }
}
