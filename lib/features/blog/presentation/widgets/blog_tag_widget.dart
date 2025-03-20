import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/theme/app_colors.dart'; // Add this import
import '../../../../core/theme/app_styles.dart';
import '../../../../core/widgets/hover_button.dart';

class CustomTextButton extends StatefulWidget {
  const CustomTextButton(
      {super.key,
      required this.text,
      this.style,
      required this.onTap,
      this.radius = 0});
  final String text;
  final TextStyle? style;
  final GestureTapCallback onTap;
  final double radius;

  @override
  State<CustomTextButton> createState() => _CustomTextButtonState();
}

class _CustomTextButtonState extends State<CustomTextButton> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: HoverButton(
        onHoverStart: () {
          setState(() {
            isActive = true;
          });
        },
        onHoverEnd: () {
          setState(() {
            isActive = false;
          });
        },
        endScale: 1.05,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.radius),
            color: isActive
                ? AppColors.green
                : Colors.transparent, // Change color on hover
            border: Border.all(color: Colors.grey.shade500),
          ),
          child: Text(
            widget.text,
            style: (widget.style ?? AppStyles.style14medium(context)).copyWith(
              color: isActive
                  ? Colors.white
                  : widget.style == null
                      ? null
                      : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
