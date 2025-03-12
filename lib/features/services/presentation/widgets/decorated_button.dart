import 'package:flutter/material.dart';
import 'package:maher_law_app/core/widget/hover_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/theme/app_colors.dart';

class DecoratedButton extends StatelessWidget {
  const DecoratedButton({
    super.key,
    required this.child,
    this.padding,
    this.reversed = false,
    this.onTap, this.radius,
  });
  final GestureTapCallback? onTap;
  final Widget child;
  final EdgeInsets? padding;
  final bool reversed;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: onTap,
      child: HoverButton(
        endScale: 1.04,
        child: Container(
          padding:
              padding ?? EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.5.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius??12),
            boxShadow: [
              BoxShadow(
                color: AppColors.grey.withAlpha(60),
                spreadRadius: 1,
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
            gradient: LinearGradient(
              colors: [AppColors.orange, AppColors.green],
              begin: reversed ? Alignment.bottomLeft : Alignment.topRight,
              end: reversed ? Alignment.topRight : Alignment.bottomLeft,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
