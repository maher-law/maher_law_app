import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maher_law_app/core/theme/app_colors.dart';
import 'package:maher_law_app/core/theme/app_styles.dart';
import 'package:maher_law_app/core/widgets/hover_button.dart';
import 'package:maher_law_app/features/home/data/models/service_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/helpers/size_config.dart';

class ServiceWidget extends StatelessWidget {
  const ServiceWidget({super.key, required this.service});
  final ServiceModel service;

  @override
  Widget build(BuildContext context) {
    return HoverButton(
      endScale: 1.05,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 2.5.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.grey.withAlpha(60),
              spreadRadius: 1,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(2.h),
              decoration: BoxDecoration(
                color: AppColors.green,
                borderRadius: BorderRadius.circular(12),
                shape: BoxShape.rectangle,
              ),
              child: SvgPicture.asset(
                service.icon,
                width: SizeConfig.isMobile ? 8.w : 3.w,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 14),
            Text(
              service.title,
              textAlign: TextAlign.center,
              style: AppStyles.style22bold(
                context,
              ).copyWith(color: Colors.black),
            ),
            SizedBox(height: 1.5.h),
            Text(
              service.dsecription,
              textAlign: TextAlign.center,
              style: AppStyles.style16medium(
                context,
              ).copyWith(color: AppColors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
