import 'package:flutter/material.dart';
import 'package:maher_law_app/core/helpers/size_config.dart';
import 'package:maher_law_app/core/models/blog_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'mini_blog_details.dart';
import 'mini_blog_image.dart';

class MiniBlogWidget extends StatelessWidget {
  const MiniBlogWidget({super.key, required this.blog});
  final Blog blog;

  @override
  Widget build(BuildContext context) {
    if (SizeConfig.isMobile) {
      return MiniMobileBlogWidget(blog: blog);
    }
    return Row(
      children: [
        const Expanded(flex: 2, child: MiniBlogImage()),
        SizedBox(width: 3.w),
        Expanded(flex: 3, child: MiniBlogDetails(blog: blog)),
      ],
    );
  }
}

class MiniMobileBlogWidget extends StatelessWidget {
  const MiniMobileBlogWidget({super.key, required this.blog});
  final Blog blog;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const MiniBlogImage(),
        SizedBox(height: 1.5.h),
        MiniBlogDetails(blog: blog),
      ],
    );
  }
}
