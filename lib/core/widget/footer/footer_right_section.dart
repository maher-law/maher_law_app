import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maher_law_app/core/widget/hover_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../helpers/size_config.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_icons.dart';
import '../../theme/app_images.dart';
import '../../theme/app_styles.dart';

class FooterRightSection extends StatelessWidget {
  const FooterRightSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          SizeConfig.isMobile
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
          mainAxisAlignment:
              SizeConfig.isMobile
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.start,
          spacing: 14,
          children: List.generate(3, (index) {
            List icons = [Icons.phone, Icons.location_on, AppIcons.whatsapp];
            return SocialMediaButton(index: index, icons: icons);
          }),
        ),
      ],
    );
  }
}

class SocialMediaButton extends StatefulWidget {
  const SocialMediaButton({
    super.key,
    required this.icons,
    required this.index,
  });
  final int index;
  final List icons;

  @override
  State<SocialMediaButton> createState() => _SocialMediaButtonState();
}

class _SocialMediaButtonState extends State<SocialMediaButton> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return HoverButton(
      onHoverStart: () => setState(() => isActive = true),
      onHoverEnd: () => setState(() => isActive = false),
      endScale: 1.05,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        height: 5.h,
        width: 5.h,
        color: isActive ? AppColors.green : AppColors.orange,
        child:
            widget.index != 2
                ? Icon(widget.icons[widget.index], color: Colors.white)
                : Padding(
                  padding: const EdgeInsets.all(4),
                  child: SvgPicture.asset(AppIcons.whatsappLight),
                ),
      ),
    );
  }
}
