import 'package:flutter/material.dart';
import 'package:mobflix/widgets/add_video_button.dart';
import 'package:mobflix/widgets/categories_list.dart';
import 'package:mobflix/widgets/featured_content.dart';
import 'package:mobflix/widgets/videos_list.dart';

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
        body: Center(
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Column(
              children: const [
                FeaturedContent(),
                CategoriesList(),
                VideosList()
              ],
            ),
          ),
        ),
        floatingActionButton: AddVideoButton(onPressed: () {
          print("Go to add video view");
        }));
  }
}
