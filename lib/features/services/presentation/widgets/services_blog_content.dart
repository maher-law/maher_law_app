import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maher_law_app/core/theme/app_styles.dart';
import 'package:maher_law_app/features/services/data/service_blog_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/theme/app_colors.dart';
import '../cubit/selected_blog_cubit.dart';

class ServicesBlogContent extends StatelessWidget {
  const ServicesBlogContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedBlogCubit, ServiceBlogModel>(
      builder: (context, selectedBlog) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 4.h),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.88, 1.0],
              colors: [Colors.white, Color.fromARGB(255, 204, 237, 232)],
            ),
            boxShadow: [
              const BoxShadow(color: Colors.black26, spreadRadius: 1, blurRadius: 30),
            ],
            borderRadius: BorderRadius.circular(40),
            color: AppColors.white,
            border: Border.all(color: AppColors.green, width: 3),
          ),
          child: Column(
            children: [
              SelectableText(
                selectedBlog.blogTitle ?? selectedBlog.title,
                style: AppStyles.style22black(
                  context,
                ).copyWith(color: AppColors.green),
              ),
              SizedBox(height: 2.h),
              SelectableText(
                selectedBlog.content,
                selectionHeightStyle: BoxHeightStyle.includeLineSpacingTop,
                textAlign: TextAlign.start,
                style: AppStyles.style16medium(
                  context,
                ).copyWith(color: AppColors.grey, height: 2),
              ),
            ],
          ),
        );
      },
    );
  }
}
