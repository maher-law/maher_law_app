import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maher_law_app/core/helpers/app_router.dart';
import 'package:maher_law_app/core/helpers/size_config.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_styles.dart';
import '../../../../../core/widget/custom_button.dart';
import 'home_about_features.dart';

class HomeAboutDetails extends StatelessWidget {
  const HomeAboutDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'معلومات عنّا',
          style: AppStyles.style16bold(context).copyWith(color: Colors.black38),
        ),
        SizedBox(height: 1.h),
        Text(
          'الوسيط القانوني',
          style: AppStyles.style40bold(
            context,
          ).copyWith(color: AppColors.green),
        ),
        SizedBox(height: 2.h),
        Text(
          ' هي شركة محاماة متخصصة في تقديم الخدمات القانونية والاستشارات القانونية والاقتصادية لرواد الأعمال والشركات الناشئة، خاصة في مجال العقود البرمجية والتكنولوجيا. تتميز شركتنا بالمزايا التالية:',
          textAlign: TextAlign.center,
          style: AppStyles.style16bold(
            context,
          ).copyWith(color: AppColors.grey, fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 4.h),
        if (SizeConfig.isDesktop) Expanded(child: HomeAboutFeatures()),
        if (!SizeConfig.isDesktop) HomeAboutFeatures(),
        SizedBox(height: 2.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              padding:
                  SizeConfig.isDesktop
                      ? EdgeInsets.symmetric(horizontal: 18, vertical: 16)
                      // : null,
                      : EdgeInsets.symmetric(horizontal: 8.w, vertical: 1.4.h),
              borderRadius: 14,
              onPressed: () {
                context.go(AppRouter.about);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'اعرف المزيد',
                    style: AppStyles.style16bold(
                      context,
                    ).copyWith(color: Colors.white),
                  ),
                  SizedBox(width: 10),
                  Icon(
                    Icons.arrow_right_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
