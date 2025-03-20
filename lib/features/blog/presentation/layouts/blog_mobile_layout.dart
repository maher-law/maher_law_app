import 'package:flutter/material.dart';
import 'package:maher_law_app/features/blog/presentation/widgets/blog_content.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/widgets/blogs_keywords_list.dart';
import '../../../../core/widgets/footer/footer_widget.dart';
import '../widgets/blog_comment_section.dart';

class BlogMobileLayout extends StatelessWidget {
  const BlogMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // const SliverMobileNavBar(),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
          sliver: SliverList.list(
            children: [
              const BlogContent(),
              SizedBox(height: 5.h),
              const BlogsKeywordsList(),
              SizedBox(height: 5.h),
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
        const SliverToBoxAdapter(child: Footer()),
      ],
    );
  }
}
