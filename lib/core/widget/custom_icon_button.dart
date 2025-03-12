import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:maher_law_app/core/theme/app_colors.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    this.color,
    required this.icon,
    this.onPressed,
    this.width,
    this.height,
  });

  final Color? color;
  final String icon;
  final void Function()? onPressed;
  final double? width, height;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: const CircleBorder(),
      color: color ?? AppColors.green,
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: SvgPicture.asset(
          icon,
          fit: BoxFit.cover,
          width: width,
          height: height,
        ),
      ),
    );
  }
}
