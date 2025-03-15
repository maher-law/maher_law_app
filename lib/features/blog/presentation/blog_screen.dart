import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/helpers/size_config.dart';
import '../../../core/models/blog_model.dart';
import '../../../core/widgets/custom_drawer.dart';
import 'cubits/cubit/blog_cubit.dart';
import 'widgets/blog_screen_body.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key, required this.blog});
  final Blog? blog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SizeConfig.isMobile ? const CustomDrawer(selectedIndex: 3) : null,
      backgroundColor: Colors.grey.shade50,
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: BlocProvider(
        create: (context) => BlogCubit(blog)..initController(context),
        child: const BlogScreenBody(),
      ),
    );
  }
}
