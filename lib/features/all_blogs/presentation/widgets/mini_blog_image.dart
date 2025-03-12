import 'package:flutter/material.dart';
import 'package:maher_law_app/core/helpers/size_config.dart';
import 'package:maher_law_app/core/widget/hover_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_images.dart';

class MiniBlogImage extends StatelessWidget {
  const MiniBlogImage({super.key});

  @override
  Widget build(BuildContext context) {
    return HoverButton(
      onTap: () {},
      endScale: 1.02,
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.green, width: 3),
          borderRadius: BorderRadius.circular(28),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Image.asset(
            AppImages.team,
            width: SizeConfig.isMobile ? 100.w : 20.w,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
