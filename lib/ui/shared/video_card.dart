import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:mobflix/models/video.dart';
import 'package:mobflix/provider/video_provider.dart';
import 'package:mobflix/ui/shared/category_tag.dart';
import 'package:url_launcher/url_launcher.dart';

class VideoCard extends StatefulWidget {
  final Video video;
  const VideoCard({super.key, required this.video});

  @override
  State<VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategoryTag(categoryName: widget.video.videoCategory!),
          FocusedMenuHolder(
              onPressed: () => _launchUrl(
                  "https://www.youtube.com/watch?v=${widget.video.videoId}"),
              menuItems: <FocusedMenuItem>[
                FocusedMenuItem(
                    title: const Text("Abrir"),
                    onPressed: () => _launchUrl(
                        "https://www.youtube.com/watch?v=${widget.video.videoId}"),
                    trailingIcon: const Icon(Icons.open_in_new)),
                FocusedMenuItem(
                    title: const Text("Editar"),
                    onPressed: () {
                      Navigator.pushNamed(context, '/registerVideo',
                              arguments: widget.video)
                          .then((video) {
                        if (video != null) {
                          Video updatedVideo = video as Video;

                          setState(() {
                            widget.video.setVideoId = updatedVideo.videoId;
                            widget.video.setVideoCategory =
                                updatedVideo.videoCategory;
                            widget.video.setVideoThumbnailUrl =
                                updatedVideo.videoThumbnailUrl;
                          });
                        }
                      });
                    },
                    trailingIcon: const Icon(Icons.edit)),
                FocusedMenuItem(
                    title: const Text("Deletar"),
                    onPressed: () {
                      final videoProvider = VideoProvider.of(context);

                      setState(() {
                        videoProvider!.videos.removeWhere((element) =>
                            element.videoId == widget.video.videoId);
                      });
                    },
                    trailingIcon: const Icon(Icons.delete)),
              ],
              child: Container(
                  decoration: const BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    )
                  ]),
                  child: Image.network(widget.video.videoThumbnailUrl!))),
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
