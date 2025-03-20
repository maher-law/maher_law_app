import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/models/blog_model.dart';
import '../../../core/theme/app_styles.dart';
import 'cubits/blog_cubit/blog_cubit.dart';
import 'widgets/blog_screen_body.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key, required this.blog});
  final Blog blog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'الوسيط القانوني',
          style: AppStyles.style24bold(context).copyWith(
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.grey.shade50,
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: BlocProvider(
        create: (context) => BlogCubit(blog)..initController(context),
        child: const BlogScreenBody(),
      ),
    );
  }
}
