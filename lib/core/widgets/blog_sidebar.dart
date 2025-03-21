import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'blogs_keywords_list.dart';
import 'blogs_search_bar.dart';

class BlogsSidebarListView extends StatelessWidget {
  const BlogsSidebarListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 4.h),
        children: [
          const BlogsSearchBar(),
          SizedBox(height: 5.h),
          const BlogsKeywordsList(),
        ],
      ),
    );
  }
}

class BlogsSidebarWidget extends StatelessWidget {
  const BlogsSidebarWidget({super.key, this.shrinkWrap = false});
  final bool shrinkWrap;

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 4.h),
        child: Column(
          // shrinkWrap: shrinkWrap,
          children: [
            const BlogsSearchBar(),
            SizedBox(height: 5.h),
            const BlogsKeywordsList(),
          ],
        ),
      ),
    );
  }
}
