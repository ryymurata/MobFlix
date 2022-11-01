import 'package:flutter/material.dart';
import 'package:mobflix/ui/shared/category_tag.dart';
import 'package:mobflix/ui/shared/section_title.dart';
import 'package:mobflix/ui/shared/videos_list.dart';

class VideosByCategory extends StatelessWidget {
  const VideosByCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Mobflix".toUpperCase(),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(height: 32),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35.0, vertical: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SectionTitle(title: "Categoria"),
                    CategoryTag(
                      categoryName: category,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 18),
              VideosList(
                category: category,
              )
            ],
          ),
        ));
  }
}
