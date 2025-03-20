import 'package:flutter/material.dart';
import 'package:maher_law_app/core/app_constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../helpers/size_config.dart';
import '../../theme/app_styles.dart';

class FooterLeftSection extends StatelessWidget {
  const FooterLeftSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: SizeConfig.isMobile
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(
          'اتصال',
          style: AppStyles.style22bold(context).copyWith(color: Colors.black),
        ),
        SizedBox(height: 3.h),
        Text(
          'الواتس: ${AppConstants.whatsappNumber}',
          textAlign: SizeConfig.isMobile ? TextAlign.center : null,
          style: AppStyles.style16medium(context).copyWith(
            color: Colors.black,
          ),
        ),
        SizedBox(height: 3.h),
        Text(
          'الايميل: ${AppConstants.email}',
          textAlign: SizeConfig.isMobile ? TextAlign.center : null,
          style: AppStyles.style16medium(context).copyWith(
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
