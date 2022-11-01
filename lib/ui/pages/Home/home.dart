import 'package:flutter/material.dart';
import 'package:mobflix/models/video.dart';
import 'package:mobflix/provider/video_provider.dart';

import 'package:mobflix/ui/pages/Home/widgets/categories_list.dart';
import 'package:mobflix/ui/pages/Home/widgets/featured_content.dart';
import 'package:mobflix/ui/shared/videos_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final videosProvider = VideoProvider.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Mobflix".toUpperCase(),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Container(
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const FeaturedContent(),
                const CategoriesList(),
                VideosList()
              ],
            ),
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(right: 18, bottom: 18),
          child: SizedBox(
            width: 52,
            height: 52,
            child: FittedBox(
              child: FloatingActionButton(
                backgroundColor: const Color(0xFF7B61FF),
                onPressed: () {
                  Navigator.pushNamed(context, '/registerVideo').then((video) {
                    if (video != null) {
                      setState(() {
                        videosProvider!.videos.add(video as Video);
                      });
                    }
                  });
                },
                child: const Icon(
                  Icons.add,
                  size: 39,
                ),
              ),
            ),
          ),
        ));
  }
}
