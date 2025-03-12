import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../core/theme/app_images.dart';
import '../../../../../core/theme/app_styles.dart';
import '../../../../../core/widget/hover_button.dart';

class HomeServicesImage extends StatelessWidget {
  const HomeServicesImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 34.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HoverButton(
            endScale: 1.005,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              width: 25.w,
              height: 70.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                image: const DecorationImage(
                  fit: BoxFit.fill,
                  alignment: Alignment.center,
                  image: AssetImage(AppImages.roman),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  Text(
                    'المجالات الاخرى',
                    style: AppStyles.style22black(context),
                  ),
                  const Spacer(),
                  HoverButton(
                    endScale: 1.02,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'انظر جميع مجالات الممارسة',
                          style: AppStyles.style16medium(context).copyWith(
                            color: Colors.white70,
                          ),
                        ),
                        const Icon(
                          Icons.arrow_right_rounded,
                          color: Colors.white70,
                          size: 24,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 14.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
