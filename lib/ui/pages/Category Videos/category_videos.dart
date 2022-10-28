import 'package:flutter/material.dart';
import 'package:mobflix/ui/shared/category_tag.dart';

class CategoryVideos extends StatelessWidget {
  final String categoryName;
  const CategoryVideos({super.key, required this.categoryName});

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
          child: Column(
        children: [
          Row(
            children: [
              const Text("Categoria: "),
              CategoryTag(categoryName: categoryName)
            ],
          ),
        ],
      )),
    );
  }
}
