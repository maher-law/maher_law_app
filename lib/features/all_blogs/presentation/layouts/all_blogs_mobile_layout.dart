import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/widget/footer/footer_widget.dart';
import '../../../../core/widget/nav_bar/sliver_nav_bar.dart';
import '../../../../core/widget/refresh_indicator.dart';

class AllBlogsMobileLayout extends StatefulWidget {
  const AllBlogsMobileLayout({super.key});

  @override
  State<AllBlogsMobileLayout> createState() => _AllBlogsMobileLayoutState();
}

class _AllBlogsMobileLayoutState extends State<AllBlogsMobileLayout> {
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
