import 'package:flutter/material.dart';
import 'package:mobflix/utils/tag_colors.dart';

class CategoryTag extends StatefulWidget {
  final String categoryName;

  const CategoryTag({super.key, required this.categoryName});

  @override
  State<CategoryTag> createState() => _CategoryTagState();
}

class _CategoryTagState extends State<CategoryTag> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          backgroundColor: TagColors.tagColors[widget.categoryName],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 0)),
      child: Text(
        widget.categoryName,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
