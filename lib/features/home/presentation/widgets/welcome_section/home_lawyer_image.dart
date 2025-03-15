import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_images.dart';
import '../../../../../core/widgets/hover_button.dart';

class HomeLawyerImage extends StatelessWidget {
  const HomeLawyerImage({super.key});

  @override
  Widget build(BuildContext context) {
    return HoverButton(
      endScale: 1.02,
      child: Container(
        height: 60.h,
        width: 38.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            const BoxShadow(
              color: Colors.black26,
              spreadRadius: .5,
              blurRadius: 30,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: CachedNetworkImage(
            imageUrl: AppImages.lawyer,
            fit: BoxFit.cover,
            placeholder: (context, url) {
              return const Center(child: CircularProgressIndicator(color: AppColors.green));
            },
            errorWidget: (context, error, stackTrace) {
              return const Icon(
                Icons.error,
                size: 40,
                color: AppColors.orange,
              );
            },
          ),
        ),
      ),
    );
  }
}

class HomeMobileLawyerImage extends StatelessWidget {
  const HomeMobileLawyerImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 4.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          const BoxShadow(
            color: Colors.black26,
            spreadRadius: .5,
            blurRadius: 30,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Image.asset(
          AppImages.lawyer,
          fit: BoxFit.cover,
          // width: SizeConfig.width * .7,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(
              Icons.error,
              size: 40,
              color: AppColors.orange,
            );
          },
        ),
      ),
    );
  }
}
