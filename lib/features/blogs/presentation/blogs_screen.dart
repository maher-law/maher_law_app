import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/theme/app_styles.dart';
import '../../../core/widgets/whatsapp_button.dart';
import '../../home/presentation/cubits/pagination_cubit/pagination_cubit.dart';
import '../../home/presentation/widgets/blogs_list_view.dart';

class BlogsScreen extends StatelessWidget {
  const BlogsScreen({super.key, required this.blogs});
  final bool blogs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          blogs ? 'مقالات' : 'نماذج عقود',
          style: AppStyles.style24bold(context).copyWith(
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.grey.shade50,
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: const WhatsappButton(),
      body: BlocProvider(
        create: (context) => PaginationCubit(blogs)..loadData(),
        child: const BlogsScreenBody(),
      ),
    );
  }
}

class BlogsScreenBody extends StatelessWidget {
  const BlogsScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
          sliver: const BlogsListView(),
        ),
      ],
    );
  }
}
