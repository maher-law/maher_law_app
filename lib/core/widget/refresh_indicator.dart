import 'package:flutter/material.dart';
import 'package:maher_law_app/core/theme/app_colors.dart';

class CustomRefreshIndicator extends StatelessWidget {
  final Widget child;
  final Future<void> Function() onRefresh;
  final Color backgroundColor;
  final Color color;

  const CustomRefreshIndicator({
    super.key,
    required this.child,
    required this.onRefresh,
    this.backgroundColor = AppColors.green,
    this.color = AppColors.white,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      backgroundColor: backgroundColor,
      color: color,
      onRefresh: onRefresh, // Parent provides refresh logic
      child: child,
    );
  }
}
