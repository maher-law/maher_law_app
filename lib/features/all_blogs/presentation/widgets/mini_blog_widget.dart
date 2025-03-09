import 'package:flutter/material.dart';
import 'package:maher_law_app/core/models/blog_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'mini_blog_details.dart';
import 'mini_blog_image.dart';

class MiniBlogWidget extends StatelessWidget {
  const MiniBlogWidget({super.key, required this.blog});
  final Blog blog;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 2, child: MiniBlogImage()),
        SizedBox(width: 3.w),
        Expanded(flex: 3, child: MiniBlogDetails(blog: blog)),
      ],
    );
  }
}
