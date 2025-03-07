import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:maher_law_app/core/helpers/functions.dart';

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
        padding: EdgeInsets.all(12),
        child: SvgPicture.asset(AppIcons.whatsapp),
      ),
    );
  }
}
