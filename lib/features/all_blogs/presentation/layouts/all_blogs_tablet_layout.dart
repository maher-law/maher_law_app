import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maher_law_app/features/all_blogs/presentation/cubits/pagination_cubit/pagination_cubit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/widgets/blogs_keywords_list.dart';
import '../../../../core/widgets/blogs_search_bar.dart';
import '../../../../core/widgets/footer/footer_widget.dart';
import '../../../../core/widgets/nav_bar/sliver_nav_bar.dart';
import '../widgets/blogs_list_view.dart';

class AllBlogsTabletLayout extends StatelessWidget {
  const AllBlogsTabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverTabletNavBar(),
        SliverPadding(
          padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w),
          sliver: const BlogsListView(sliver: true),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
          sliver: SliverList.list(
            children: [
              BlogsSearchBar(
                onTap: () {
                  context.read<PaginationCubit>().getBySearch();
                },
                controller: context.read<PaginationCubit>().searchController,
                decorated: false,
                padding: EdgeInsets.symmetric(horizontal: 2.w),
              ),
              SizedBox(height: 2.h),
              const BlogsKeywordsList(),
              SizedBox(height: 5.h),
            ],
          ),
        ),
        const SliverToBoxAdapter(child: Footer()),
      ],
    );
  }
}
