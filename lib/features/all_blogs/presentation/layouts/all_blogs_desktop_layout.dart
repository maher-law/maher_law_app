import 'package:flutter/material.dart';
import 'package:maher_law_app/core/widgets/blog_sidebar.dart';
import 'package:maher_law_app/core/widgets/nav_bar/sliver_nav_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/widgets/footer/footer_widget.dart';
import '../widgets/blogs_list_view.dart';

class AllBlogsDesktopLayout extends StatelessWidget {
  const AllBlogsDesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverDesktopNavBar(),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          sliver: SliverFillRemaining(
            child: Row(
              children: [
                const Expanded(flex: 2, child: BlogsListView()),
                SizedBox(width: 4.w),
                const Expanded(flex: 1, child: BlogsSidebarListView()),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(child: Footer()),
      ],
    );
  }
}
