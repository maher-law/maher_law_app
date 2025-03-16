import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/blog_cubit/blog_cubit.dart';
import 'blog_content_widgets.dart';

class BlogContent extends StatelessWidget {
  const BlogContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlogCubit, BlogState>(
      builder: (context, state) {
        switch (state) {
          case BlogSuccess():
            return const BlogContentWidgets();
          case BlogFailure():
            return const Center(
              child: Text('هناك خطأ ما يرجى المحاولة لاحقًا'),
            );
          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
