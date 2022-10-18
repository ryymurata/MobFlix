import 'package:flutter/material.dart';

class CategoryTag extends StatefulWidget {
  final String categoryName;
  final Color tagColor;
  const CategoryTag(
      {super.key, required this.categoryName, required this.tagColor});

  @override
  State<CategoryTag> createState() => _CategoryTagState();
}

class _CategoryTagState extends State<CategoryTag> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          backgroundColor: widget.tagColor,
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
