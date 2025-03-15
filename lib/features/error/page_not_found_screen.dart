import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:maher_law_app/core/helpers/app_router.dart';
import 'package:maher_law_app/core/helpers/size_config.dart';
import 'package:maher_law_app/core/theme/app_icons.dart';
import 'package:maher_law_app/core/theme/app_styles.dart';
import 'package:maher_law_app/core/widgets/hover_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/theme/app_colors.dart';

class PageNotFoundScreen extends StatelessWidget {
  const PageNotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (SizeConfig.isDesktop)
                  Lottie.asset(AppIcons.error404, width: 45.w),
                if (!SizeConfig.isDesktop)
                  Transform.scale(
                    scale: 1.4,
                    child: Lottie.asset(AppIcons.error404),
                  ),
                SizedBox(height: 3.h),
                Text(
                  'عذرًا هذه الصفحة غير موجودة، نرجو منك التوجه للصفحة الرئيسية',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: AppStyles.style22bold(context),
                ),
                SizedBox(height: 5.h),
                HoverButton(
                  endScale: 1.02,
                  onTap: () {
                    context.go(AppRouter.home);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.grey.withAlpha(60),
                          spreadRadius: 1,
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      gradient: const LinearGradient(
                        colors: [AppColors.orange, AppColors.green],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                      ),
                    ),
                    child: Text(
                      'الرجوع للصفحة الرئيسية',
                      style: AppStyles.style22bold(
                        context,
                      ).copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
