import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../widgets/blog_comment_section.dart';
import '../widgets/blog_content.dart';

class BlogTabletLayout extends StatelessWidget {
  const BlogTabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
          sliver: SliverList.list(
            children: [
              const BlogContent(),
            ],
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          sliver: SliverList(
            delegate: SliverChildListDelegate.fixed(
              [
                SizedBox(height: 2.h),
                const Align(
                  alignment: Alignment.center,
                  child: BlogCommentSection(),
                ),
                SizedBox(height: 8.h),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
