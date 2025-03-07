import 'package:flutter/material.dart';
import 'package:maher_law_app/core/widget/nav_bar/sliver_nav_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/widget/footer/footer_widget.dart';
import '../widgets/consultant_banner_widget.dart';
import '../widgets/location_section/home_location_section.dart';
import '../widgets/rates_section/home_rates_section.dart';
import '../widgets/services_section/home_services_desktop_section.dart';
import '../widgets/steps_section/home_steps_section.dart';
import '../widgets/welcome_section/home_welcome_section.dart';

class HomeDesktopLayout extends StatelessWidget {
  const HomeDesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverDesktopNavBar(),
        SliverList(
          delegate: SliverChildListDelegate.fixed([
            HomeWelcomeSection(),
            HomeServicesDesktopSection(),
            ConsultantBanner(),
            HomeStepsSection(),
            HomeRatesSection(),
            SizedBox(height: 5.h),
            HomeLocationSection(),
            SizedBox(height: 10.h),
            Footer(),
          ]),
        ),
      ],
    );
  }
}
