import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/helpers/size_config.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';

class ServicesHeaderSection extends StatelessWidget {
  const ServicesHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 6.h),
        Container(
          padding: EdgeInsets.only(bottom: 2.h),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: AppColors.grey.withAlpha(80),
                width: 3,
              ),
            ),
          ),
          child: Text(
            'كيف نستطيع مساعدتك ؟',
            style: SizeConfig.isMobile
                ? AppStyles.style18medium(context)
                : AppStyles.style16medium(context),
          ),
        ),
        SizedBox(height: 2.h),
        Text(
          'تفاصيل بعض مجالات الممارسة',
          textAlign: TextAlign.center,
          style: AppStyles.style22black(context).copyWith(
            color: AppColors.green,
          ),
        ),
      ],
    );
  }
}
