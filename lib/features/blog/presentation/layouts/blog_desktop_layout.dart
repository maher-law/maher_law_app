import 'package:flutter/material.dart';
import 'package:maher_law_app/core/widgets/nav_bar/sliver_nav_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/widgets/blogs_keywords_list.dart';
import '../../../../core/widgets/footer/footer_widget.dart';
import '../widgets/blog_comment_section.dart';
import '../widgets/blog_content.dart';

class BlogDesktopLayout extends StatelessWidget {
  const BlogDesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverDesktopNavBar(),
        SliverToBoxAdapter(child: SizedBox(height: 10.h)),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          sliver: SliverList(
            delegate: SliverChildListDelegate.fixed(
              [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(flex: 2, child: BlogContent()),
                    SizedBox(width: 4.w),
                    const Expanded(flex: 1, child: BlogsKeywordsList()),
                  ],
                ),
                SizedBox(height: 8.h),
                const Align(
                  alignment: Alignment.centerRight,
                  child: BlogCommentSection(),
                ),
                SizedBox(height: 8.h),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(child: Footer()),
      ],
    );
  }
}
