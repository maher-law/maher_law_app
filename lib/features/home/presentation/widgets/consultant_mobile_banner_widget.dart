import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maher_law_app/core/helpers/size_config.dart';
import 'package:maher_law_app/core/theme/app_styles.dart';
import 'package:maher_law_app/core/widget/hover_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/helpers/functions.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_icons.dart';

class ConsultantMobileBanner extends StatelessWidget {
  const ConsultantMobileBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return HoverButton(
      endScale: 1.05,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 6.w),
        width: SizeConfig.width,
        child: Container(
          padding: EdgeInsets.only(top: 4.h, bottom: 2.h, right: 20, left: 20),
          width: SizeConfig.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            gradient: const LinearGradient(
              colors: [AppColors.orange, AppColors.green],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Spacer(),
              Column(
                children: [
                  Text(
                    'اطلب استشارة الان',
                    style: AppStyles.style22black(
                      context,
                    ).copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'يمكنك الوصول إلينا بسهولة وسرعة',
                    style: AppStyles.style16medium(context),
                  ),
                ],
              ),
              SizedBox(height: 3.h),
              MaterialButton(
                splashColor: AppColors.green,
                elevation: 0,
                focusElevation: 0,
                hoverElevation: 0,
                onPressed: () {
                  pushWhatsapp(context);
                },
                height: 24,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 2.h),
                color: Colors.white24,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 15,
                  children: [
                    Text(
                      'من خلال الواتس',
                      textDirection: TextDirection.ltr,
                      style: AppStyles.style16bold(
                        context,
                      ).copyWith(color: Colors.white),
                    ),
                    SvgPicture.asset(AppIcons.whatsapp, width: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
