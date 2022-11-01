import 'package:flutter/material.dart';
import 'package:mobflix/models/video.dart';

class VideoProvider extends InheritedWidget {
  final List<Video> videos;

  const VideoProvider({Key? key, required this.videos, required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(VideoProvider oldWidget) =>
      videos.length != oldWidget.videos.length;

  static VideoProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<VideoProvider>();
  }
}
