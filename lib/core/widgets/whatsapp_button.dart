import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:maher_law_app/core/helpers/functions.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../theme/app_colors.dart';
import '../theme/app_icons.dart';

class WhatsappButton extends StatelessWidget {
  const WhatsappButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        pushWhatsapp(context);
      },
      backgroundColor: AppColors.green,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: SvgPicture.asset(AppIcons.whatsapp),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  const SocialButton({super.key, this.onTap, this.icon});
  final GestureTapCallback? onTap;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      child: IconButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateColor.resolveWith((_) => AppColors.green),
        ),
        color: AppColors.green,
        splashColor: AppColors.white,
        padding: const EdgeInsets.all(10),
        onPressed: onTap ??
            () {
              pushWhatsapp(context);
            },
        icon: SvgPicture.asset(icon ?? AppIcons.whatsapp, width: 8.w),
      ),
    );
  }
}
