import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/theme/app_styles.dart';

class ListErrorText extends StatelessWidget {
  const ListErrorText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 30.h),
          Text(
            text,
            textAlign: TextAlign.center,
            style: AppStyles.style18bold(context).copyWith(
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
