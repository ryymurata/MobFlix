import 'package:flutter/material.dart';
import 'package:mobflix/ui/shared/category_tag.dart';

class VideoCard extends StatelessWidget {
  const VideoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CategoryTag(categoryName: "Mobile"),
          GestureDetector(
            onTap: () {
              print("video selected");
            },
            child: Container(
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  )
                ]),
                child: Image.asset("images/video_thumb.png")),
          ),
          const SizedBox(height: 18)
        ],
      ),
    );
  }
}
