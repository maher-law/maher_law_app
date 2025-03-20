import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../app_constants.dart';
import '../../../helpers/functions.dart';
import '../../../helpers/size_config.dart';
import '../../../widgets/hover_button.dart';
import '../../app_colors.dart';

class SocialMediaButton extends StatefulWidget {
  const SocialMediaButton({
    super.key,
    required this.icon,
    required this.index,
  });
  
  final int index;
  final String icon;

  @override
  State<SocialMediaButton> createState() => _SocialMediaButtonState();
}

class _SocialMediaButtonState extends State<SocialMediaButton> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return HoverButton(
      onTap: () {
        if (widget.index == 1) {
          pushWhatsapp(context);
        } else {
          pushToCustom(context, url: 'mailto:${AppConstants.email}');
        }
      },
      onHoverStart: () => setState(() => isActive = true),
      onHoverEnd: () => setState(() => isActive = false),
      endScale: 1.05,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        // height: 5.h,
        // width: 5.h,
        color: isActive ? AppColors.green : AppColors.orange,
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: SvgPicture.asset(
            widget.icon,
            width: SizeConfig.isDesktop
                ? 2.w
                : SizeConfig.isTablet
                    ? 4.w
                    : 8.w,
          ),
        ),
      ),
    );
  }
}
