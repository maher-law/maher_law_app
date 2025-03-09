import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:maher_law_app/core/app_constants.dart';
import 'package:maher_law_app/core/widget/nav_bar/sliver_nav_bar.dart';
import 'package:maher_law_app/features/blog/presentation/widgets/blog_content_image.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/widget/blog_sidebar.dart';
import '../../../../core/widget/footer/footer_widget.dart';
import '../widgets/blog_tags.dart';

class BlogDesktopLayout extends StatelessWidget {
  const BlogDesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverDesktopNavBar(),
        SliverToBoxAdapter(child: SizedBox(height: 10.h)),
        //! SliverToBoxAdapter(child: Text(context.read<BlogCubit>().blog.title)),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          sliver: SliverList(
            delegate: SliverChildListDelegate.fixed(
              [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: BlogContent(
                          jsonContent: AppConstants.textBlogContentJson),
                    ),
                    SizedBox(width: 4.w),
                    Expanded(flex: 1, child: BlogsSidebar(shrinkWrap: true)),
                  ],
                ),
                SizedBox(height: 3.h),
                BlogTags(),
                SizedBox(height: 5.h),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(child: Footer()),
      ],
    );
  }
}

class BlogContent extends StatefulWidget {
  final String jsonContent; // Accept JSON content dynamically

  const BlogContent({super.key, required this.jsonContent});

  @override
  State<BlogContent> createState() => _BlogContentState();
}

class _BlogContentState extends State<BlogContent> {
  late final QuillController controller;

  @override
  void initState() {
    super.initState(); // Call super first

    // Parse the JSON content into a Delta

    // Initialize the controller
    controller = QuillController(
      document: Document.fromJson(jsonDecode(widget.jsonContent)),
      selection: const TextSelection.collapsed(offset: 0),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlogContentImage(),
        SizedBox(height: 4.h),
        QuillEditor(
          focusNode: FocusNode(),
          controller: controller,
          scrollController: ScrollController(),
          config: QuillEditorConfig(
            scrollable: true,
            autoFocus: false,
            expands: false,
            padding: EdgeInsets.zero,
          ),
        ),
      ],
    );
  }
}
