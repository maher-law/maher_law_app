import 'package:flutter/material.dart';
import 'package:maher_law_app/core/theme/app_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../data/service_blog_model.dart';
import 'service_blog_widget.dart';

class ServicesBlogsList extends StatelessWidget {
  const ServicesBlogsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
      decoration: BoxDecoration(
        boxShadow: [
          const BoxShadow(color: Colors.black26, spreadRadius: 1, blurRadius: 30),
        ],
        borderRadius: BorderRadius.circular(40),
        color: AppColors.green,
      ),
      child: Column(
        spacing: 2.h,
        children: List.generate(
          6,
          (index) => ServiceBlogWidget(blog: blogs[index]),
        ),
      ),
    );
  }
}
