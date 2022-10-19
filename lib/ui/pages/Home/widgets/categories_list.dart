import 'package:flutter/material.dart';
import 'package:mobflix/ui/shared/category_tag.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 28, 0, 28),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: const [
            SizedBox(width: 35),
            CategoryTag(categoryName: "Front End"),
            SizedBox(width: 18),
            CategoryTag(categoryName: "Programação"),
            SizedBox(width: 18),
            CategoryTag(categoryName: "Mobile"),
            SizedBox(width: 18),
            CategoryTag(categoryName: "Back End"),
            SizedBox(width: 18),
            CategoryTag(categoryName: "Data Science"),
            SizedBox(width: 18),
            CategoryTag(categoryName: "Devops"),
            SizedBox(width: 18),
            CategoryTag(categoryName: "Ux e Design"),
            SizedBox(width: 35),
          ],
        ),
      ),
    );
  }
}
