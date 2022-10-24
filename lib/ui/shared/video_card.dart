import 'package:flutter/material.dart';
import 'package:mobflix/models/video.dart';
import 'package:mobflix/services/api_service.dart';
import 'package:mobflix/ui/shared/category_tag.dart';

class VideoCard extends StatefulWidget {
  final Video video;
  const VideoCard({super.key, required this.video});

  @override
  State<VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  ApiService service = ApiService();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategoryTag(categoryName: widget.video.videoCategory!),
          GestureDetector(
            onTap: () {},
            child: Container(
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  )
                ]),
                child: Image.network(widget.video.videoThumbnailUrl!)),
          ),
          const SizedBox(height: 18)
        ],
      ),
    );
  }
}
