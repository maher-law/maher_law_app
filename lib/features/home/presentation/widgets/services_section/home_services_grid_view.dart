import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../data/models/service_model.dart';
import 'service_widget.dart';

class HomeServicesGridView extends StatelessWidget {
  const HomeServicesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 4,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 30,
          mainAxisExtent: 28.h,
          mainAxisSpacing: 4.h,
        ),
        itemBuilder: (context, index) {
          return HomeServiceWidget(service: servicesData[index]);
        },
      ),
    );
  }
}
