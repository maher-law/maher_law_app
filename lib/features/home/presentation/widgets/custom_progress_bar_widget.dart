import 'package:flutter/material.dart';
import 'package:maher_law_app/core/helpers/size_config.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';

enum ProgressBarColorTheme {
  cyan([Colors.cyan, AppColors.green]),
  orange([Colors.yellow, AppColors.orange]),
  purple([Colors.pink, Colors.deepPurpleAccent]);

  final List<Color> colors;
  const ProgressBarColorTheme(this.colors);
}

class CustomProgressBarWidget extends StatelessWidget {
  const CustomProgressBarWidget({
    super.key,
    required this.text,
    required this.colorTheme,
  });

  final ProgressBarColorTheme colorTheme;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SimpleCircularProgressBar(
          size: SizeConfig.isMobile ? 160 : 100,
          progressStrokeWidth: SizeConfig.isMobile ? 18 : 15,
          backStrokeWidth: SizeConfig.isMobile ? 18 : 15,
          animationDuration: 2,
          progressColors: colorTheme.colors,
          mergeMode: true,
          onGetText: (double value) {
            return Text(
              '${value.toInt()}%',
              style:
                  SizeConfig.isMobile
                      ? AppStyles.style22black(
                        context,
                      ).copyWith(color: AppColors.grey)
                      : AppStyles.style16bold(
                        context,
                      ).copyWith(color: AppColors.grey),
            );
          },
        ),
        SizedBox(height: 2.h),
        Text(
          text,
          textAlign: TextAlign.center,
          style: AppStyles.style16bold(context).copyWith(color: AppColors.grey),
        ),
      ],
    );
  }
}
