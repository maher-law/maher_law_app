import 'package:flutter/material.dart';
import 'package:maher_law_app/features/blog/presentation/widgets/blog_content.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/widgets/blogs_keywords_list.dart';
import '../../../../core/widgets/blogs_search_bar.dart';
import '../../../../core/widgets/footer/footer_widget.dart';
import '../../../../core/widgets/nav_bar/sliver_nav_bar.dart';
import '../../../../core/widgets/refresh_indicator.dart';
import '../widgets/blog_comment_section.dart';

class BlogMobileLayout extends StatefulWidget {
  const BlogMobileLayout({super.key});

  @override
  State<BlogMobileLayout> createState() => _BlogMobileLayoutState();
}

class _BlogMobileLayoutState extends State<BlogMobileLayout> {
  @override
  Widget build(BuildContext context) {
    return CustomRefreshIndicator(
      onRefresh: () async {
        setState(() {});
      },
      child: CustomScrollView(
        slivers: [
          const SliverMobileNavBar(),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
            sliver: SliverList.list(
              children: [
                const BlogContent(),
                SizedBox(height: 5.h),
                BlogsSearchBar(
                  decorated: false,
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                ),
                SizedBox(height: 2.h),
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
      ),
    );
  }
}
