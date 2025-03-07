import 'package:flutter/material.dart';
import 'package:maher_law_app/core/helpers/size_config.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'home_lawyer_image.dart';
import 'home_welcome_details.dart';

class HomeWelcomeSection extends StatelessWidget {
  const HomeWelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 15.h, right: 6.w, left: 4.w, bottom: 7.5.h),
      width: SizeConfig.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: HomeWelcomeDetails()),
          SizedBox(width: 5.w),
          Expanded(child: HomeLawyerImage()),
        ],
      ),
    );
  }
}
