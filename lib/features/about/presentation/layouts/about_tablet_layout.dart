import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/widgets/footer/footer_widget.dart';
import '../../../../core/widgets/nav_bar/sliver_nav_bar.dart';
import '../widgets/about_details.dart';
import '../widgets/progress_bar_section.dart';

class AboutTabletLayout extends StatelessWidget {
  const AboutTabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverTabletNavBar(),
        SliverList(
          delegate: SliverChildListDelegate.fixed(
            [
              SizedBox(height: 6.h),
              const AboutDetails(),
              SizedBox(height: 6.h),
              const ProgressBarDesktopSection(),
              // SizedBox(height: 6.h),
              // const AboutOwnersDesktopSection(),
              SizedBox(height: 10.h),
              const Footer(),
            ],
          ),
        ),
      ],
    );
  }
}
