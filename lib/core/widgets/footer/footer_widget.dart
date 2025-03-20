import 'package:flutter/material.dart';
import 'package:maher_law_app/core/theme/app_colors.dart';
import 'package:maher_law_app/core/widgets/footer/footer_left_section.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../helpers/size_config.dart';
import 'footer_right_section.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: AppColors.cyan,
          width: SizeConfig.width,
          padding: EdgeInsets.only(
            top: 5.h,
            right: SizeConfig.isMobile ? 3.w : 8.w,
            left: 3.w,
            bottom: 8.h,
          ),
          child: SizeConfig.width > SizeConfig.mobile
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8.w,
                  children: [
                    const Expanded(child: FooterRightSection()),
                    const Expanded(child: FooterLeftSection()),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 8.w,
                  children: [
                    const FooterRightSection(),
                    const FooterLeftSection(),
                  ],
                ),
        ),
      ],
    );
  }
}
