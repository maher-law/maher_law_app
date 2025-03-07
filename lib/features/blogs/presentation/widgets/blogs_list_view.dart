import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'mini_blog_widget.dart';

class BlogsListView extends StatelessWidget {
  const BlogsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        itemCount: 3,
        itemBuilder: (context, index) {
          return MiniBlogWidget();
        },
        separatorBuilder: (context, index) => SizedBox(height: 14.h),
      ),
    );
  }
}
