import 'package:flutter/material.dart';

import '../../../../../core/theme/app_styles.dart';
import '../../../../../core/widget/hover_button.dart';

class ShowAllServicesButton extends StatelessWidget {
  const ShowAllServicesButton({super.key, this.color});
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return HoverButton(
      endScale: 1.02,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'انظر جميع مجالات الممارسة',
            style: AppStyles.style16medium(context).copyWith(
              color:color?? Colors.white70,
            ),
          ),
          Icon(
            Icons.arrow_right_rounded,
            color:color?? Colors.white70,
            size: 24,
          ),
        ],
      ),
    );
  }
}
