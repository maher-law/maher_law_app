import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/widget/footer/footer_widget.dart';
import '../../../../core/widget/nav_bar/sliver_nav_bar.dart';
import '../../../../core/widget/refresh_indicator.dart';
import '../widgets/learn_more_button.dart';
import '../widgets/services_blogs_section.dart';
import '../widgets/services_header_section.dart';
import '../widgets/services_image_widget.dart';
import '../widgets/sliver_service_grid.dart';

class ServicesTabletLayout extends StatefulWidget {
  const ServicesTabletLayout({super.key});

  @override
  State<ServicesTabletLayout> createState() => _ServicesTabletLayoutState();
}

class _ServicesTabletLayoutState extends State<ServicesTabletLayout> {
  @override
  Widget build(BuildContext context) {
    return CustomRefreshIndicator(
       onRefresh: () async {
        setState(() {});
      },
      child: CustomScrollView(
        slivers: [
          const SliverTabletNavBar(),
          const SliverToBoxAdapter(child: ServicesHeaderSection()),
          SliverToBoxAdapter(child: SizedBox(height: 6.h)),
          const SliverServicesGrid(),
          SliverToBoxAdapter(child: SizedBox(height: 3.h)),
          SliverList(
            delegate: SliverChildListDelegate.fixed(
              [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.h),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [LearnMoreButton()],
                  ),
                ),
                SizedBox(height: 4.h),
                const ServicesDesktopImageWidget(),
                SizedBox(height: 10.h),
                const ServicesBlogsSection(),
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
