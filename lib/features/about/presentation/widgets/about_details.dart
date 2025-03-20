import 'package:flutter/material.dart';
import 'package:maher_law_app/core/helpers/size_config.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';

class AboutDetails extends StatelessWidget {
  const AboutDetails({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        Text(
          'من نحن',
          style: AppStyles.style22medium(
            context,
          ).copyWith(color: Colors.grey.shade600),
        ),
        SizedBox(height: 1.h),
        Text(
          'قصة الوسيط القانوني',
          style: AppStyles.style26bold(
            context,
          ).copyWith(color: AppColors.green),
        ),
        SizedBox(height: 3.h),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.isDesktop ? 20.w : 8.w,
          ),
          child: Text(
            AppConstants.bio,
            textAlign: TextAlign.center,
            style: AppStyles.style16bold(
              context,
            ).copyWith(color: AppColors.grey),
          ),
        ),
      ],
    );
  }
}

