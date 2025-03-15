import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maher_law_app/core/helpers/app_router.dart';
import 'package:maher_law_app/core/theme/app_styles.dart';
import 'package:maher_law_app/features/services/presentation/widgets/decorated_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/helpers/size_config.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_images.dart';

class ServicesDesktopImageWidget extends StatelessWidget {
  const ServicesDesktopImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      width: SizeConfig.width,
      height: 85.h,
      decoration: BoxDecoration(
        border: Border.all(width: 4, color: Colors.white),
        borderRadius: BorderRadius.circular(40),
        image: const DecorationImage(
          image: AssetImage(AppImages.team),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey.withAlpha(60),
            spreadRadius: 10,
            blurRadius: 20,
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.grey.withAlpha(140),
              AppColors.grey.withAlpha(200),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('نحن نقدم لك', style: AppStyles.style30medium(context)),
            SizedBox(height: 4.h),
            Text(
              'أفضل حل قانوني',
              style: AppStyles.style55bold(
                context,
              ).copyWith(color: Colors.white),
            ),
            SizedBox(height: 6.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // DecoratedButton(
                //   onTap: () {},
                //   padding: EdgeInsets.symmetric(
                //     horizontal: 2.w,
                //     vertical: 1.2.h,
                //   ),
                //   child: Text(
                //     'احجز موعد',
                //     style: AppStyles.style16bold(
                //       context,
                //     ).copyWith(color: Colors.white),
                //   ),
                // ),
                // SizedBox(width: 1.w),
                DecoratedButton(
                  onTap: () {
                    context.go(AppRouter.consultation);
                  },
                  reversed: true,
                  padding: EdgeInsets.symmetric(
                    horizontal: 2.w,
                    vertical: 1.2.h,
                  ),
                  child: Text(
                    'اطلب استشارة',
                    style: AppStyles.style16bold(
                      context,
                    ).copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ServicesMobileImageWidget extends StatelessWidget {
  const ServicesMobileImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      width: SizeConfig.width,
      height: SizeConfig.isMobile ? null : 85.h,
      decoration: BoxDecoration(
        border: Border.all(width: 4, color: Colors.white),
        borderRadius: BorderRadius.circular(40),
        image: const DecorationImage(
          image: AssetImage(AppImages.team),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey.withAlpha(60),
            spreadRadius: 10,
            blurRadius: 20,
          ),
        ],
      ),
      child: Container(
        padding:
            SizeConfig.isMobile ? EdgeInsets.symmetric(vertical: 8.h) : null,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.grey.withAlpha(140),
              AppColors.grey.withAlpha(200),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('نحن نقدم لك', style: AppStyles.style30medium(context)),
            SizedBox(height: 2.h),
            Text(
              'أفضل حل قانوني',
              style: SizeConfig.isMobile
                  ? AppStyles.style40bold(
                      context,
                    ).copyWith(color: Colors.white)
                  : AppStyles.style55bold(
                      context,
                    ).copyWith(color: Colors.white),
            ),
            SizedBox(height: 3.h),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // DecoratedButton(
                //   onTap: () {},
                //   padding: EdgeInsets.symmetric(
                //     horizontal: 6.w,
                //     vertical: 1.2.h,
                //   ),
                //   child: Text(
                //     'احجز موعد',
                //     style: AppStyles.style16bold(
                //       context,
                //     ).copyWith(color: Colors.white),
                //   ),
                // ),
                // SizedBox(height: 2.h),
                DecoratedButton(
                  onTap: () {
                    context.go(AppRouter.consultation);
                  },
                  padding: EdgeInsets.symmetric(
                    horizontal: 6.w,
                    vertical: 1.2.h,
                  ),
                  child: Text(
                    'اطلب استشارة',
                    style: AppStyles.style16bold(
                      context,
                    ).copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
