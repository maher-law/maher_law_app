import 'package:flutter/material.dart';
import 'package:maher_law_app/core/theme/app_styles.dart';

import '../theme/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.maxLines,
    this.validator,
    this.minLines,  this.textAlign =TextAlign.start,
  });

  final TextEditingController controller;
  final String hintText;
  final int? maxLines, minLines;
  final TextAlign textAlign;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      minLines: minLines,
      maxLines: maxLines,
      controller: controller,
      textAlign: textAlign,
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
