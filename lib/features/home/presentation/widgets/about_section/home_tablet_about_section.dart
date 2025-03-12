import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../core/helpers/size_config.dart';
import 'home_about_details.dart';

class HomeTabletAboutSection extends StatelessWidget {
  const HomeTabletAboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 80.h,
      color: Colors.white,
      padding: EdgeInsets.only(
        top: 7.5.h,
        right: SizeConfig.isMobile ? 4.w : 6.w,
        left: 4.w,
        bottom: 7.5.h,
      ),
      width: SizeConfig.width,
      child: const HomeAboutDetails(),
    );
  }
}
