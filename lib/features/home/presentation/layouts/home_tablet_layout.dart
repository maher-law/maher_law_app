import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/widget/footer/footer_widget.dart';
import '../../../../core/widget/nav_bar/sliver_nav_bar.dart';
import '../../../../core/widget/refresh_indicator.dart';
import '../widgets/about_section/home_tablet_about_section.dart';
import '../widgets/consultant_banner_widget.dart';
import '../widgets/location_section/home_location_section.dart';
import '../widgets/rates_section/home_rates_section.dart';
import '../widgets/services_section/home_services_tablet_section.dart';
import '../widgets/steps_section/home_steps_section.dart';
import '../widgets/welcome_section/home_welcome_section.dart';

class HomeTabletLayout extends StatefulWidget {
  const HomeTabletLayout({super.key});

  @override
  State<HomeTabletLayout> createState() => _HomeTabletLayoutState();
}

class _HomeTabletLayoutState extends State<HomeTabletLayout> {
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
                HomeWelcomeSection(),
                HomeServicesTabletSection(),
                HomeTabletAboutSection(),
                ConsultantBanner(),
                HomeMobileStepsSection(),
                HomeRatesSection(),
                SizedBox(height: 5.h),
                HomeLocationSection(),
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
