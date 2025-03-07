import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    this.child,
    this.color,
    this.padding,
    this.borderRadius,
    this.height,
    this.width,
  });

  final void Function()? onPressed;
  final Widget? child;
  final Color? color;
  final EdgeInsets? padding;
  final double? borderRadius, height, width;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height: height ?? 30,
      minWidth: width,
      padding: padding ?? EdgeInsets.symmetric(horizontal: 40, vertical: 16),
      color: color ?? AppColors.green,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 18),
      ),
      child: child,
    );
  }
}
