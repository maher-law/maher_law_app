import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/widget/footer/footer_widget.dart';
import '../../../../core/widget/nav_bar/sliver_nav_bar.dart';
import '../../../../core/widget/refresh_indicator.dart';
import '../widgets/about_details.dart';
import '../widgets/about_owners_section.dart';
import '../widgets/progress_bar_section.dart';

class AboutTabletLayout extends StatefulWidget {
  const AboutTabletLayout({super.key});

  @override
  State<AboutTabletLayout> createState() => _AboutTabletLayoutState();
}

class _AboutTabletLayoutState extends State<AboutTabletLayout> {
  @override
  Widget build(BuildContext context) {
    return CustomRefreshIndicator(
      onRefresh: () async {
        setState(() {});
      },
      child: CustomScrollView(
        slivers: [
          const SliverTabletNavBar(),
          SliverList(
            delegate: SliverChildListDelegate.fixed(
              [
                SizedBox(height: 6.h),
                const AboutDetails(),
                SizedBox(height: 6.h),
                const ProgressBarDesktopSection(),
                SizedBox(height: 6.h),
                const AboutOwnersDesktopSection(),
                SizedBox(height: 10.h),
                const Footer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
