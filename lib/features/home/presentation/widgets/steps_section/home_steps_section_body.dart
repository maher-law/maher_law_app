import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maher_law_app/core/theme/app_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_icons.dart';
import 'steps_list_widget.dart';

class HomeStepsSectionBody extends StatelessWidget {
  const HomeStepsSectionBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // SizedBox(height: 8.h,),
        SvgPicture.asset(AppIcons.court, height: 5.h),
        SizedBox(height: 14),
        Text(
          'خطوة بخطوة',
          style: AppStyles.style16bold(context).copyWith(color: Colors.white),
        ),
        SizedBox(height: 4),
        Text(
          'كيف نعمل؟',
          style: AppStyles.style40bold(
            context,
          ).copyWith(color: AppColors.green),
        ),
        SizedBox(height: 5.h),
        StepsListWidget(),
      ],
    );
  }
}

class HomeMobileStepsSectionBody extends StatelessWidget {
  const HomeMobileStepsSectionBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 8.h),
        SvgPicture.asset(AppIcons.court, height: 5.h),
        SizedBox(height: 14),
        Text(
          'خطوة بخطوة',
          style: AppStyles.style16bold(context).copyWith(color: Colors.white),
        ),
        SizedBox(height: 4),
        Text(
          'كيف نعمل؟',
          style: AppStyles.style40bold(
            context,
          ).copyWith(color: AppColors.green),
        ),
        SizedBox(height: 5.h),
        StepsListWidget(),
      ],
    );
  }
}
