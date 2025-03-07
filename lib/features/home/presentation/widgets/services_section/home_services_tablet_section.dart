import 'package:flutter/material.dart';
import 'package:maher_law_app/core/theme/app_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../core/theme/app_styles.dart';
import 'home_services_list_view.dart';

class HomeServicesTabletSection extends StatelessWidget {
  const HomeServicesTabletSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeServicesListView(),
        SizedBox(height: 2.h),
        MaterialButton(
          minWidth: 40.w,
          padding: EdgeInsets.symmetric(vertical: 1.4.h, horizontal: 2.w),
          onPressed: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          color: AppColors.green,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '    انظر جميع مجالات الممارسة',
                style: AppStyles.style16bold(
                  context,
                ).copyWith(color: Colors.white),
              ),
              SizedBox(width: 1.w),
              Icon(Icons.arrow_right_rounded, color: Colors.white, size: 34),
            ],
          ),
        ),
        SizedBox(height: 5.h),
      ],
    );
  }
}
