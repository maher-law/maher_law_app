import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maher_law_app/core/models/blog_model.dart';
import 'package:maher_law_app/core/theme/app_images.dart';
import 'package:maher_law_app/features/all_blogs/presentation/cubits/cubit/pagination_cubit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/app_constants.dart';
import 'mini_blog_widget.dart';
import 'pagination_controllers.dart';

class BlogsListView extends StatelessWidget {
  const BlogsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: BlocBuilder<PaginationCubit, PaginationState>(
        builder: (context, state) {
          switch (state) {
            case PaginationLoaded():
              return ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                itemCount: state.data.length + 1,
                itemBuilder: (context, index) {
                  if (index == state.data.length) {
                    return PaginationControllers();
                  }
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                    child: MiniBlogWidget(
                      blog: Blog(
                        id: '123',
                        thumbnailImageUrl: AppImages.lawyer,
                        title: state.data[index]['title'],
                        contentJson: AppConstants.textBlogContentJson,
                        htmlContent: 'htmlContent',
                        imageUrls: [],
                        slug: 'slugTest',
                        createdAt: DateTime.now(),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 8.h),
              );
            case PaginationError():
              return Center(child: Text('يرجى المحاول مرة أخرى'));
            default:
              return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
// class BlogsListView extends StatelessWidget {
//   const BlogsListView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ScrollConfiguration(
//       behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
//       child: BlocBuilder<PaginationCubit, PaginationState>(
//         builder: (context, state) {
//           switch (state) {
//             case PaginationLoaded():
//               return SliverList.separated(
//                 itemCount: state.data.length,
//                 itemBuilder: (context, index) {
//                   return InkWell(
//                     splashColor: Colors.transparent,
//                     highlightColor: Colors.transparent,
//                     hoverColor: Colors.transparent,
//                     borderRadius: BorderRadius.circular(20),
//                     onTap: () {
//                       context.go(
//                         '${AppRouter.blogs}/مقالة-تجريبية',
//                         extra: Blog(
//                           id: '123',
//                           thumbnailImageUrl: AppImages.lawyer,
//                           title: state.data[index]['title'],
//                           contentJson: AppConstants.textBlogContentJson,
//                           htmlContent: 'htmlContent',
//                           imageUrls: [],
//                           slug: 'slugTest',
//                           createdAt: DateTime.now(),
//                         ),
//                       );
//                     },
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
//                       child: MiniBlogWidget(
//                         blog: Blog(
//                           id: '123',
//                           thumbnailImageUrl: AppImages.lawyer,
//                           title: state.data[index]['title'],
//                           contentJson: AppConstants.textBlogContentJson,
//                           htmlContent: 'htmlContent',
//                           imageUrls: [],
//                           slug: 'slugTest',
//                           createdAt: DateTime.now(),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//                 separatorBuilder: (context, index) => SizedBox(height: 14.h),
//               );
//             case PaginationError():
//               return SliverToBoxAdapter(
//                   child: Center(child: Text('يرجى المحاول مرة أخرى')));
//             default:
//               return SliverToBoxAdapter(
//                   child: Center(child: CircularProgressIndicator()));
//           }
//         },
//       ),
//     );
//   }
// }
