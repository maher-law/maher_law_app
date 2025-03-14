import 'package:flutter/material.dart';
import 'package:maher_law_app/core/helpers/size_config.dart';
import 'package:maher_law_app/core/widget/hover_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/theme/app_colors.dart';

class MiniBlogImage extends StatelessWidget {
  const MiniBlogImage({super.key, required this.image});
  final String image;

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
          child: Image.network(
            image,
            width: SizeConfig.isMobile ? 100.w : 20.w,
            height: 30.h,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
