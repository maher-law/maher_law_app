import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maher_law_app/core/helpers/size_config.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/helpers/app_router.dart';
import '../../../../core/theme/app_styles.dart';
import 'decorated_button.dart';

class LearnMoreButton extends StatelessWidget {
  const LearnMoreButton({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedButton(
      padding: EdgeInsets.symmetric(
        vertical: 1.h,
        horizontal: SizeConfig.isMobile ? 4.w : 2.w,
      ),
      onTap: () {
        context.go(AppRouter.blogs);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'تعمق أكثر',
            style: AppStyles.style22bold(context).copyWith(color: Colors.white),
          ),
          SizedBox(width: 2.4.w),
          Icon(
            Icons.chat,
            color: Colors.white,
            size: SizeConfig.isMobile ? 6.w : 3.w,
          ),
        ],
      ),
    );
  }
}
