import 'package:flutter/material.dart';
import 'package:maher_law_app/core/widget/nav_bar/sliver_nav_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/widget/footer/footer_widget.dart';
import '../widgets/blogs_list_view.dart';

class BlogsDesktopLayout extends StatelessWidget {
  const BlogsDesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverDesktopNavBar(),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          sliver: SliverFillRemaining(
            child: Row(
              children: [
                Expanded(flex: 2, child: BlogsListView()),
                SizedBox(width: 4.w),
                Expanded(flex: 1, child: Container(color: Colors.black12)),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(child: Footer()),
      ],
    );
  }
}
