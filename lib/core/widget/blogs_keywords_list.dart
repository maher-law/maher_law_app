import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../theme/app_colors.dart';

class BlogsKeywordsList extends StatelessWidget {
  const BlogsKeywordsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.grey, width: 2.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: .5,
            blurRadius: 30,
            offset: Offset(0, 2),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 8.h),
      child: Column(
        children: [
          SizedBox(height: 40.h),
        ],
      ),
    );
  }
}
