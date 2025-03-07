import 'package:flutter/material.dart';
import 'package:maher_law_app/core/widget/footer/footer_widget.dart';
import 'package:maher_law_app/features/services/presentation/widgets/services_blogs_section.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/widget/nav_bar/sliver_nav_bar.dart';
import '../widgets/learn_more_button.dart';
import '../widgets/services_header_section.dart';
import '../widgets/services_image_widget.dart';
import '../widgets/sliver_service_grid.dart';

class ServicesDesktopLayout extends StatelessWidget {
  const ServicesDesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverDesktopNavBar(),
        SliverToBoxAdapter(child: ServicesHeaderSection()),
        SliverToBoxAdapter(child: SizedBox(height: 6.h)),
        SliverServicesGrid(),
        SliverToBoxAdapter(child: SizedBox(height: 3.h)),
        SliverList(
          delegate: SliverChildListDelegate.fixed([
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [LearnMoreButton()],
              ),
            ),
            SizedBox(height: 4.h),
            ServicesDesktopImageWidget(),
            SizedBox(height: 10.h),
            ServicesBlogsSection(),
            SizedBox(height: 10.h),
            Footer(),
          ]),
        ),
      ],
    );
  }
}
