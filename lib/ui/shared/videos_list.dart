import 'package:flutter/material.dart';
import 'package:mobflix/models/video.dart';
import 'package:mobflix/ui/shared/video_card.dart';

class VideosList extends StatefulWidget {
  const VideosList({super.key});

  @override
  State<VideosList> createState() => _VideosListState();
}

final _videosList = [
  Video("Mobile", "https://i.ytimg.com/vi/pcnfjJG3jY4/mqdefault.jpg"),
  Video("Mobile", "https://i.ytimg.com/vi/pcnfjJG3jY4/mqdefault.jpg"),
  Video("Mobile", "https://i.ytimg.com/vi/pcnfjJG3jY4/mqdefault.jpg")
];

class _VideosListState extends State<VideosList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 0),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: _videosList.length,
        itemBuilder: (context, index) {
          return VideoCard(video: _videosList[index]);
        },
      ),
    );
  }
}
