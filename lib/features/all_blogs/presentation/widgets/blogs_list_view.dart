import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maher_law_app/core/helpers/app_router.dart';
import 'package:maher_law_app/core/theme/app_images.dart';
import 'package:maher_law_app/features/all_blogs/data/models/blog_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/app_constants.dart';
import 'mini_blog_widget.dart';

class BlogsListView extends StatelessWidget {
  const BlogsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        itemCount: 10,
        itemBuilder: (context, index) {
          return InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              context.go(
                '${AppRouter.blogs}/مقالة-تجريبية',
                extra: Blog(
                  id: '123',
                  thumbnailImageUrl: AppImages.lawyer,
                  title: 'title',
                  contentJson: AppConstants.textBlogContentJson,
                  htmlContent: 'htmlContent',
                  imageUrls: [],
                  slug: 'slugTest',
                  createdAt: DateTime.now(),
                ),
              );
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              child: MiniBlogWidget(),
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: 14.h),
      ),
    );
  }
}
