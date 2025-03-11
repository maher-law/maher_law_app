import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'blogs_keywords_list.dart';
import 'blogs_search_bar.dart';

class BlogsSidebar extends StatelessWidget {
  const BlogsSidebar({super.key, this.shrinkWrap = false});
  final bool shrinkWrap;

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: ListView(
        shrinkWrap: shrinkWrap,
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 4.h),
        children: [
          BlogsSearchBar(),
          SizedBox(height: 5.h),
          BlogsKeywordsList(),
        ],
      ),
    );
  }
}
