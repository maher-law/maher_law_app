
import 'package:flutter/material.dart';

import '../../../../core/theme/app_styles.dart';

class ListErrorText extends StatelessWidget {
  const ListErrorText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: AppStyles.style18bold(context),
      ),
    );
  }
}