import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'home_services_list_view.dart';

class HomeServicesTabletSection extends StatelessWidget {
  const HomeServicesTabletSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HomeServicesListView(),
        SizedBox(height: 5.h),
      ],
    );
  }
}
