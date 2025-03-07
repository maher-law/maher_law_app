import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:maher_law_app/core/widget/hover_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_icons.dart';
import '../../../../core/theme/app_styles.dart';

class AboutOwnersDesktopSection extends StatelessWidget {
  const AboutOwnersDesktopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        HoverButton(
          endScale: 1.03,
          child: Container(
            width: 40.w,
            padding: EdgeInsets.symmetric(vertical: 12.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                  color: AppColors.cyan.withAlpha(120),
                  spreadRadius: 5,
                  blurRadius: 20,
                ),
                BoxShadow(
                  blurStyle: BlurStyle.inner,
                  color: AppColors.cyan.withAlpha(120),
                  spreadRadius: 5,
                  blurRadius: 20,
                ),
              ],
            ),
            child: Column(
              children: [
                SvgPicture.asset(AppIcons.court, width: 1.8.w),
                SizedBox(height: 2.h),
                Text(
                  'المؤسس',
                  style: AppStyles.style18medium(
                    context,
                  ).copyWith(color: AppColors.grey.withAlpha(180)),
                ),
                SizedBox(height: 1.h),
                Text(
                  'ماهر الشافعي',
                  style: AppStyles.style30medium(context).copyWith(
                    color: AppColors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class AboutOwnersMobileSection extends StatelessWidget {
  const AboutOwnersMobileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        HoverButton(
          endScale: 1.03,
          child: Container(
            width: 80.w,
            padding: EdgeInsets.symmetric(vertical: 12.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                  color: AppColors.cyan.withAlpha(120),
                  spreadRadius: 5,
                  blurRadius: 20,
                ),
                BoxShadow(
                  blurStyle: BlurStyle.inner,
                  color: AppColors.cyan.withAlpha(120),
                  spreadRadius: 5,
                  blurRadius: 20,
                ),
              ],
            ),
            child: Column(
              children: [
                SvgPicture.asset(AppIcons.court, width: 8.w),
                SizedBox(height: 2.h),
                Text(
                  'المؤسس',
                  style: AppStyles.style18medium(
                    context,
                  ).copyWith(color: AppColors.grey.withAlpha(180)),
                ),
                SizedBox(height: 1.h),
                Text(
                  'ماهر الشافعي',
                  style: AppStyles.style30medium(context).copyWith(
                    color: AppColors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
