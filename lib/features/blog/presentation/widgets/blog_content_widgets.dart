import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maher_law_app/core/helpers/size_config.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';
import '../cubits/blog_cubit/blog_cubit.dart';
import 'blog_content_image.dart';
import 'blog_text_content.dart';

class BlogContentWidgets extends StatelessWidget {
  const BlogContentWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BlogContentImage(),
        SizedBox(height: 4.h),
        SelectableText(
          context.read<BlogCubit>().blog.title,
          textAlign: TextAlign.center,
          style: SizeConfig.isMobile
              ? AppStyles.style26bold(context).copyWith(
                  color: AppColors.grey,
                )
              : AppStyles.style22bold(context).copyWith(
                  color: AppColors.grey,
                ),
        ),
        SizedBox(height: 3.h),
        const BlogTextContent(),
        SizedBox(height: 3.h),
        // const BlogTags(),
      ],
    );
  }
}
