import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../cubits/cubit/blog_cubit.dart';
import 'blog_content_image.dart';
import 'blog_tags.dart';
import 'blog_text_content.dart';

class BlogContent extends StatelessWidget {
  const BlogContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlogCubit, BlogState>(
      builder: (context, state) {
        switch (state) {
          case BlogSuccess():
            return BlogContentWidgets();
          case BlogFailure():
            return Center(
              child: Text('هناك خطأ ما يرجى المحاولة لاحقًا'),
            );
          default:
            return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class BlogContentWidgets extends StatelessWidget {
  const BlogContentWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlogContentImage(),
        SizedBox(height: 8.h),
        BlogTextContent(),
        SizedBox(height: 3.h),
        BlogTags(),
      ],
    );
  }
}
