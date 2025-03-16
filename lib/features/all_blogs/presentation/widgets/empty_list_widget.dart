import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/theme/app_icons.dart';
import '../../../../core/theme/app_styles.dart';

class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Lottie.asset(AppIcons.empty, width: 30.w),
        SizedBox(height: 1.h),
        Text('لا توجد نتائج', style: AppStyles.style18bold(context)),
      ],
    );
  }
}
