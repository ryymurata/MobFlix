import 'package:flutter/material.dart';
import 'package:mobflix/ui/pages/Home/widgets/add_video_button.dart';
import 'package:mobflix/ui/pages/Home/widgets/categories_list.dart';
import 'package:mobflix/ui/pages/Home/widgets/featured_content.dart';
import 'package:mobflix/ui/shared/videos_list.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
              children: const [
                FeaturedContent(),
                CategoriesList(),
                VideosList(),
              ],
            ),
          ),
        ),
        floatingActionButton: const AddVideoButton());
  }
}
