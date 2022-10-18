import 'package:flutter/material.dart';
import 'package:mobflix/widgets/category_tag.dart';

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
            CategoryTag(categoryName: "Front End", tagColor: Color(0xFF5781EF)),
            SizedBox(width: 18),
            CategoryTag(
                categoryName: "Programação", tagColor: Color(0xFF19940F)),
            SizedBox(width: 18),
            CategoryTag(categoryName: "Mobile", tagColor: Color(0xFFD82D2D)),
            SizedBox(width: 18),
            CategoryTag(categoryName: "Back End", tagColor: Color(0xFFD88B2D)),
            SizedBox(width: 18),
            CategoryTag(
                categoryName: "Data Science", tagColor: Color(0xFFD8D22D)),
            SizedBox(width: 18),
            CategoryTag(categoryName: "Devops", tagColor: Color(0xFF2DAAD8)),
            SizedBox(width: 18),
            CategoryTag(
                categoryName: "Ux e Design", tagColor: Color(0xFFCD2DD8)),
            SizedBox(width: 35),
          ],
        ),
      ),
    );
  }
}
