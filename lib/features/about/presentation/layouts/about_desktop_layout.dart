import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/widget/footer/footer_widget.dart';
import '../../../../core/widget/nav_bar/sliver_nav_bar.dart';
import '../widgets/about_details.dart';
import '../widgets/about_owners_section.dart';
import '../widgets/progress_bar_section.dart';

class AboutDesktopLayout extends StatelessWidget {
  const   AboutDesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverDesktopNavBar(),
        SliverList(
          delegate: SliverChildListDelegate.fixed(
            [
              SizedBox(height: 6.h),
              AboutDetails(),
              SizedBox(height: 6.h),
              ProgressBarDesktopSection(),
              SizedBox(height: 12.h),
              AboutOwnersDesktopSection(),
              SizedBox(height: 10.h),
              Footer(),
            ],
          ),
        ),
      ],
    );
  }
}
