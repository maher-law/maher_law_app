import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../helpers/size_config.dart';
import '../../../widgets/footer/footer_right_section.dart';
import '../../app_icons.dart';
import '../../app_images.dart';
import '../../app_styles.dart';

class FooterRightSection extends StatelessWidget {
  const FooterRightSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: SizeConfig.isMobile
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Image.asset(AppImages.logo, height: 12.h, fit: BoxFit.contain),
        SizedBox(height: 4.h),
        Text(
          'نحرص على إيجاد الحل الأمثل للعقود التكنولوجية، ويسعى فريقنا إلى النجاح في تحقيق أهداف عملائنا والحفاظ على مصالحهم القانونية.',
          textAlign: SizeConfig.isMobile ? TextAlign.center : null,
          style: AppStyles.style16medium(context),
        ),
        SizedBox(height: 4.h),
        Row(
          mainAxisAlignment: SizeConfig.isMobile
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          spacing: 14,
          children: List.generate(2, (index) {
            List icons = [AppIcons.email, AppIcons.whatsapp];
            return SocialMediaButton(index: index, icon: icons[index]);
          }),
        ),
      ],
    );
  }
}
