import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/widgets/footer/footer_widget.dart';
import '../../../../core/widgets/nav_bar/sliver_nav_bar.dart';
import '../widgets/about_section/home_tablet_about_section.dart';
import '../widgets/consultant_banner_widget.dart';
import '../widgets/services_section/home_services_tablet_section.dart';
import '../widgets/steps_section/home_steps_section.dart';
import '../widgets/welcome_section/home_welcome_section.dart';

class HomeTabletLayout extends StatelessWidget {
  const HomeTabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverTabletNavBar(),
        SliverList(
          delegate: SliverChildListDelegate.fixed(
            [
              const HomeWelcomeSection(),
              const HomeServicesTabletSection(),
              const HomeTabletAboutSection(),
              const ConsultantBanner(),
              const HomeMobileStepsSection(),
              // const HomeRatesSection(),
              // SizedBox(height: 5.h),
              // const HomeLocationSection(),
              SizedBox(height: 8.h),
              const Footer(),
            ],
          ),
        ),
      ],
    );
  }
}
