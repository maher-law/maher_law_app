import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../core/helpers/size_config.dart';
import 'home_about_details.dart';
import 'home_balance_image.dart';

class HomeDesktopAboutSection extends StatelessWidget {
  const HomeDesktopAboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      color: Colors.white,
      padding: EdgeInsets.only(
        top: 7.5.h,
        right: 6.w,
        left: 4.w,
        bottom: 7.5.h,
      ),
      width: SizeConfig.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: HomeAboutDetails()),
          SizedBox(width: 2.w),
          HomeBalanceImage(),
        ],
      ),
    );
  }
}
