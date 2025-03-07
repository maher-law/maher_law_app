import 'package:flutter/material.dart';
import 'package:maher_law_app/core/helpers/size_config.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'home_lawyer_image.dart';
import 'home_welcome_details.dart';

class HomeMobileWelcomeSection extends StatelessWidget {
  const HomeMobileWelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 4.h, right: 4.w, left: 4.w, bottom: 7.5.h),
      width: SizeConfig.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HomeMobileLawyerImage(),
          SizedBox(width: 5.h),
          HomeWelcomeDetails(),
        ],
      ),
    );
  }
}
