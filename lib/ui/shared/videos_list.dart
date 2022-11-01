import 'package:flutter/material.dart';
import 'package:mobflix/models/video.dart';
import 'package:mobflix/provider/video_provider.dart';
import 'package:mobflix/ui/shared/video_card.dart';

class VideosList extends StatelessWidget {
  final String? category;
  const VideosList({super.key, this.category});

  @override
  Widget build(BuildContext context) {
    final videoProvider = VideoProvider.of(context);
    List<Video>? videos;

    if (category != null) {
      videos = videoProvider!.videos
          .where((video) => video.videoCategory == category)
          .toList();
    } else {
      videos = List.from(videoProvider!.videos);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 0),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: videos.length,
        itemBuilder: (context, index) {
          return VideoCard(video: videos![index]);
        },
      ),
    );
  }
}
