import 'package:flutter/material.dart';
import 'package:maher_law_app/core/helpers/extensions/numbers_convertor.dart';
import 'package:morphable_shape/morphable_shape.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../core/helpers/size_config.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_styles.dart';

class StepNumberWidget extends StatelessWidget {
  const StepNumberWidget({
    super.key,
    required this.index,
    this.color,
    this.size,
  });

  final int index;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return DecoratedShadowedShape(
      shape: RectangleShapeBorder(
        borderRadius: const DynamicBorderRadius.all(
          DynamicRadius.circular(Length(100)),
        ),
        cornerStyles: RectangleCornerStyles.all(CornerStyle.straight),
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: size ?? (SizeConfig.width > SizeConfig.tablet ? 5.w : 8.w),
        height: size ?? (SizeConfig.width > SizeConfig.tablet ? 5.w : 8.w),
        color: color ?? AppColors.orange,
        child: Center(
          child: Text(index.toArabic(), style: AppStyles.style22black(context)),
        ),
      ),
    );
  }
}
