import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:maher_law_app/core/theme/app_icons.dart';
import 'package:maher_law_app/features/all_blogs/presentation/cubits/pagination_cubit/pagination_cubit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/models/blog_model.dart';
import 'empty_list_widget.dart';
import 'list_error_text.dart';
import 'mini_blog_widget.dart';
import 'pagination_controllers.dart';

class BlogsListView extends StatelessWidget {
  const BlogsListView({super.key, this.padding, this.sliver = false});
  final EdgeInsets? padding;
  final bool sliver;

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: BlocBuilder<PaginationCubit, PaginationState>(
        builder: (context, state) {
          switch (state) {
            case PaginationLoaded():
              List<Blog> blogs = state.data
                  .map((doc) => Blog.fromFirestore(doc.id, data: doc.data()))
                  .toList();
              if (sliver) {
                if (state.data.isEmpty) {
                  return const SliverToBoxAdapter(child: EmptyListWidget());
                }
                return SliverList.separated(
                  itemCount: state.data.length + 1,
                  itemBuilder: (context, index) {
                    if (index == state.data.length) {
                      return const PaginationControllers();
                    } else {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 4,
                        ),
                        child: MiniBlogWidget(blog: blogs[index]),
                      );
                    }
                  },
                  separatorBuilder: (context, index) => SizedBox(height: 8.h),
                );
              } else {
                if (state.data.isEmpty) {
                  return const SingleChildScrollView(child: EmptyListWidget());
                } else {
                  return ListView.separated(
                    padding: padding ?? EdgeInsets.symmetric(vertical: 10.h),
                    itemCount: state.data.length + 1,
                    itemBuilder: (context, index) {
                      if (index == state.data.length) {
                        return const PaginationControllers();
                      } else {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 4,
                          ),
                          child: MiniBlogWidget(blog: blogs[index]),
                        );
                      }
                    },
                    separatorBuilder: (context, index) => SizedBox(height: 8.h),
                  );
                }
              }

            case PaginationError():
              if (sliver) {
                return SliverToBoxAdapter(
                  child: ListErrorText(text: state.message),
                );
              } else {
                return Center(child: ListErrorText(text: state.message));
              }
            default:
              if (sliver) {
                return SliverToBoxAdapter(
                  child: Center(child: Lottie.asset(AppIcons.loading)),
                );
              } else {
                return Center(child: Lottie.asset(AppIcons.loading));
              }
          }
        },
      ),
    );
  }
}
