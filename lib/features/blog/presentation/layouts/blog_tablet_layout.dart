import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/widget/footer/footer_widget.dart';
import '../../../../core/widget/nav_bar/sliver_nav_bar.dart';
import '../../../../core/widget/refresh_indicator.dart';

class BlogTabletLayout extends StatefulWidget {
  const BlogTabletLayout({super.key});

  @override
  State<BlogTabletLayout> createState() => _BlogTabletLayoutState();
}

class _BlogTabletLayoutState extends State<BlogTabletLayout> {
  @override
  Widget build(BuildContext context) {
    return CustomRefreshIndicator(
       onRefresh: () async {
        setState(() {});
      },
      child: CustomScrollView(
        slivers: [
          SliverTabletNavBar(),
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
