import 'package:flutter/material.dart';
import 'package:maher_law_app/core/widget/nav_bar/sliver_nav_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/widget/blog_sidebar.dart';
import '../../../../core/widget/footer/footer_widget.dart';
import '../widgets/blog_content.dart';
import '../widgets/blog_tags.dart';

class BlogDesktopLayout extends StatelessWidget {
  const BlogDesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverDesktopNavBar(),
        SliverToBoxAdapter(child: SizedBox(height: 10.h)),
        //! SliverToBoxAdapter(child: Text(context.read<BlogCubit>().blog.title)),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          sliver: SliverList(
            delegate: SliverChildListDelegate.fixed(
              [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 2, child: BlogContent()),
                    SizedBox(width: 4.w),
                    Expanded(flex: 1, child: BlogsSidebar(shrinkWrap: true)),
                  ],
                ),
                SizedBox(height: 3.h),
                BlogTags(),
                SizedBox(height: 5.h),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(child: Footer()),
      ],
    );
  }
}
