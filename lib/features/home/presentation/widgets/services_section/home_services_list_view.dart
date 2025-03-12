import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../data/models/service_model.dart';
import 'service_widget.dart';

class HomeServicesListView extends StatelessWidget {
  const HomeServicesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      itemBuilder: (context, index) {
        return HomeServiceWidget(service: servicesData[index]);
      },
      separatorBuilder: (context, index) => SizedBox(height: 2.h),
    );
  }
}
