import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../services/presentation/widgets/decorated_button.dart';
import 'blog_tag_widget.dart';

class BlogTags extends StatelessWidget {
  const BlogTags({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        DecoratedButton(
          radius: 0,
          padding: EdgeInsets.symmetric(horizontal: .5.w, vertical: 4),
          child: Icon(Icons.tag, color: Colors.white),
        ),
        ...List.generate(
          4,
          (index) => InkWell(onTap: () {}, child: BlogTagWidget()),
        ),
      ],
    );
  }
}