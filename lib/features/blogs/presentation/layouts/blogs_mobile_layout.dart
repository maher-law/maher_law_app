import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/widget/footer/footer_widget.dart';
import '../../../../core/widget/nav_bar/sliver_nav_bar.dart';
import '../../../../core/widget/refresh_indicator.dart';

class BlogsMobileLayout extends StatefulWidget {
  const BlogsMobileLayout({super.key});

  @override
  State<BlogsMobileLayout> createState() => _BlogsMobileLayoutState();
}

class _BlogsMobileLayoutState extends State<BlogsMobileLayout> {
  @override
  Widget build(BuildContext context) {
    return CustomRefreshIndicator(
       onRefresh: () async {
        setState(() {});
      },
      child: CustomScrollView(
        slivers: [
          SliverMobileNavBar(),
          SliverList(
            delegate: SliverChildListDelegate.fixed(
              [
              
                SizedBox(height: 8.h),
                Footer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
