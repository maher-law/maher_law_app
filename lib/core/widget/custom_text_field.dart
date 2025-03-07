import 'package:flutter/material.dart';
import 'package:maher_law_app/core/theme/app_styles.dart';

import '../theme/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.maxLines,
    this.minLines,
  });

  final TextEditingController controller;
  final String hintText;
  final int? maxLines, minLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: minLines,
      maxLines: maxLines,
      controller: controller,
      style: AppStyles.style18bold(context).copyWith(color: AppColors.grey),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppStyles.style18medium(
          context,
        ).copyWith(color: AppColors.grey.withAlpha(130)),
        border: border(),
        focusedBorder: border(color: AppColors.orange),
        enabledBorder: border(),
      ),
    );
  }

  UnderlineInputBorder border({Color? color}) {
    return UnderlineInputBorder(
      borderSide: BorderSide(color: color ?? AppColors.green, width: 2),
    );
  }
}
