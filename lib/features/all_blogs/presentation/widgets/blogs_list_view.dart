import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maher_law_app/features/all_blogs/presentation/cubits/pagination_cubit/pagination_cubit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/models/blog_model.dart';
import 'mini_blog_widget.dart';
import 'pagination_controllers.dart';

class BlogsListView extends StatelessWidget {
  const BlogsListView({super.key, this.padding,  this.sliver=false});
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
            if(sliver){
              return SliverList.separated(
                itemCount: state.data.length + 1,
                itemBuilder: (context, index) {
                  List<Blog> blogs = state.data
                      .map(
                          (doc) => Blog.fromFirestore(doc.id, data: doc.data()))
                      .toList();
                  if (index == state.data.length) {
                    return const PaginationControllers();
                  }
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                    child: MiniBlogWidget(blog: blogs[index]),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 8.h),
              );
            }else{
              return ListView.separated(
                padding: padding ?? EdgeInsets.symmetric(vertical: 10.h),
                itemCount: state.data.length + 1,
                itemBuilder: (context, index) {
                  List<Blog> blogs = state.data
                      .map(
                          (doc) => Blog.fromFirestore(doc.id, data: doc.data()))
                      .toList();
                  if (index == state.data.length) {
                    return const PaginationControllers();
                  }
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                    child: MiniBlogWidget(blog: blogs[index]),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 8.h),
              );
            }
              
            case PaginationError():
              if(sliver){
              return SliverToBoxAdapter(child: Center(child: Text(state.message)));

              }else{
              return Center(child: Text(state.message));

              }
            default:
            if(sliver){
              return const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()));

              }else{
              return const Center(child: CircularProgressIndicator());

              }
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
