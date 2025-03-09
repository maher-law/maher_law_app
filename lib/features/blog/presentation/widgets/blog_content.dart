import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'blog_content_image.dart';
import 'blog_text_content.dart';

class BlogContent extends StatelessWidget {
  const BlogContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlogContentImage(),
        SizedBox(height: 8.h),
        BlogTextContent(),
      ],
    );
  }
}
