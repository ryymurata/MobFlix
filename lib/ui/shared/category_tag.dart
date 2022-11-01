import 'package:flutter/material.dart';
import 'package:mobflix/utils/tag_colors.dart';

class CategoryTag extends StatelessWidget {
  final String categoryName;
  const CategoryTag({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/videosByCategory',
            arguments: categoryName);
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: TagColors.tagColors[categoryName],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 0)),
      child: Text(
        categoryName,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
