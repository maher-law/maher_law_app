import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:go_router/go_router.dart';
import 'package:maher_law_app/core/helpers/app_router.dart';
import 'package:maher_law_app/core/helpers/extensions/timestamp.dart';
import 'package:maher_law_app/core/helpers/size_config.dart';
import 'package:maher_law_app/core/models/blog_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';
import '../../../services/presentation/widgets/decorated_button.dart';

class MiniBlogDetails extends StatelessWidget {
  const MiniBlogDetails({super.key, required this.blog});
  final Blog blog;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: SizeConfig.isMobile
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          Text(
            blog.createdAt.toArabic(),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.style14medium(context),
          ),
          SizedBox(height: 2.h),
          InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: () {
              context.go(
                '${AppRouter.blogs}/${blog.id}/${blog.slug}',
                extra: blog,
              );
            },
            child: Text(
              blog.title,
              style: AppStyles.style24bold(context),
            ),
          ),
          // HoverTextButton(

          //   withBorder: false,
          //   text: ,
          //   activeColor: AppColors.orange,
          //   style: AppStyles.style24bold(context),
          // ),
          SizedBox(height: 2.h),
          Text(
            Document.fromJson(jsonDecode(blog.contentJson)).toPlainText(),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.style16medium(context).copyWith(
              color: AppColors.grey.withAlpha(200),
            ),
          ),
          DecoratedButton(
            onTap: () {
              context.go(
                '${AppRouter.blogs}/${blog.id}/${blog.slug}',
                extra: blog,
              );
            },
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.isMobile ? 6.w : 1.4.w,
              vertical: 1.h,
            ),
            child: Text(
              'اقرأ أكثر',
              style: AppStyles.style16medium(context).copyWith(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MiniTabletBlogDetails extends StatelessWidget {
  const MiniTabletBlogDetails({super.key, required this.blog});
  final Blog blog;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            blog.createdAt.toArabic(),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.style22medium(context).copyWith(
              color: AppColors.grey.withAlpha(200),
            ),
          ),
          SizedBox(height: 2.h),
          InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: () {
              context.go(
                '${AppRouter.blogs}/${blog.id}/${blog.slug}',
                extra: blog,
              );
            },
            child: Text(
              blog.title,
              style: AppStyles.style40bold(context).copyWith(
                color: AppColors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // HoverTextButton(

          //   withBorder: false,
          //   text: ,
          //   activeColor: AppColors.orange,
          //   style: AppStyles.style24bold(context),
          // ),
          SizedBox(height: 2.h),
          Text(
            Document.fromJson(jsonDecode(blog.contentJson)).toPlainText(),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.style30medium(context).copyWith(
              color: AppColors.grey.withAlpha(200),
            ),
          ),
          DecoratedButton(
            onTap: () {
              context.go(
                '${AppRouter.blogs}/${blog.id}/${blog.slug}',
                extra: blog,
              );
            },
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 1.h,
            ),
            child: Text(
              'اقرأ أكثر',
              style: AppStyles.style22bold(context).copyWith(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
