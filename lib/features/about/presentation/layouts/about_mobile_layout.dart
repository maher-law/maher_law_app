import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/widget/footer/footer_widget.dart';
import '../../../../core/widget/nav_bar/sliver_nav_bar.dart';
import '../../../../core/widget/refresh_indicator.dart';
import '../widgets/about_details.dart';
import '../widgets/about_owners_section.dart';
import '../widgets/progress_bar_section.dart';

class AboutMobileLayout extends StatefulWidget {
  const AboutMobileLayout({super.key});

  @override
  State<AboutMobileLayout> createState() => _AboutMobileLayoutState();
}

class _AboutMobileLayoutState extends State<AboutMobileLayout> {
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
                SizedBox(height: 6.h),
                AboutDetails(),
                SizedBox(height: 6.h),
                ProgressBarMobileSection(),
                SizedBox(height: 6.h),
                AboutOwnersMobileSection(),
                SizedBox(height: 10.h),
                Footer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
