import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/widget/blogs_keywords_list.dart';
import '../../../../core/widget/blogs_search_bar.dart';
import '../../../../core/widget/footer/footer_widget.dart';
import '../../../../core/widget/nav_bar/sliver_nav_bar.dart';
import '../../../../core/widget/refresh_indicator.dart';
import '../widgets/blogs_list_view.dart';

class AllBlogsTabletLayout extends StatefulWidget {
  const AllBlogsTabletLayout({super.key});

  @override
  State<AllBlogsTabletLayout> createState() => _AllBlogsTabletLayoutState();
}

class _AllBlogsTabletLayoutState extends State<AllBlogsTabletLayout> {
  @override
  Widget build(BuildContext context) {
    return CustomRefreshIndicator(
      onRefresh: () async {
        setState(() {});
      },
      child: CustomScrollView(
        slivers: [
          SliverTabletNavBar(),
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w),
            sliver: BlogsListView(sliver: true),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
            sliver: SliverList.list(
              children: [
                BlogsSearchBar(
                  decorated: false,
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                ),
                SizedBox(height: 2.h),
                BlogsKeywordsList(),
                SizedBox(height: 5.h),
              ],
            ),
          ),
          SliverToBoxAdapter(child: Footer()),
        ],
      ),
    );
  }
}
