import 'package:flutter/material.dart';
import 'package:mobflix/models/video.dart';

import 'package:mobflix/ui/pages/Home/widgets/categories_list.dart';
import 'package:mobflix/ui/pages/Home/widgets/featured_content.dart';
import 'package:mobflix/ui/shared/video_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Video> videosList = [];

  @override
  Widget build(BuildContext context) {
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
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35.0, vertical: 0),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: videosList.length,
                    itemBuilder: (context, index) {
                      return VideoCard(video: videosList[index]);
                    },
                  ),
                )
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
                  Navigator.pushNamed(context, '/registerVideo')
                      .then((video) => _addVideo(video! as Video));
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

  void _addVideo(Video video) {
    setState(() {
      videosList.add(video);
    });
  }
}
